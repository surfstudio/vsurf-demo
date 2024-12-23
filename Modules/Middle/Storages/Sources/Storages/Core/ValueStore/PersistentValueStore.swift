//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Класс, отвечающий протоколу ValueStore и способный хранить информацию в постоянной памяти.
///
/// На вход принимает объект типа DataStore, так что где именно хранить данные - решаете вы сами.
/// Это может быть UserDefaults, или файловая система, или любое другое место,
/// если логика хранения будет обернута в DataStore.
///
/// - Important: На хранимый тип накладываются ограничения:
///     он должен удовлетворять протоколу `Codable`
public final class PersistentValueStore<Value: Codable>: ValueStore {

    // MARK: - Private Properties

    private let store: DataStore
    private let dataConverter: any DataConverter

    // MARK: - Initialization

    public init(store: DataStore, dataConverter: any DataConverter) {
        self.store = store
        self.dataConverter = dataConverter
    }

    // MARK: - ValueStore

    public func save(value: Value) {
        // сохранять (и потом загружать) будем не просто переданный объект,
        // а упакуем в массив - потому что encoder/decoder работают с массивами и словарями,
        // а, например, обычный Bool перегнать в Data они не смогут
        // (https://stackoverflow.com/questions/53177348)
        do {
            let data = try dataConverter.encode([value])
            try store.save(data: data)
        } catch {
            debugPrint(error)
        }
    }

    public func load() -> Value? {
        var unwrapedData: Data?
        do {
            unwrapedData = try store.load()
        } catch {
            debugPrint(error)
            return nil
        }

        guard let data = unwrapedData else {
            return nil
        }

        do {
            return try dataConverter.decode([Value].self, from: data).first
        } catch {
            debugPrint(error)
            try? store.erase()
            return nil
        }
    }

    public func erase() {
        do {
            try store.erase()
        } catch {
            debugPrint(error)
        }
    }

}

// MARK: - Property wrappers

@propertyWrapper
public struct PersistentValue<Value: Codable> {

    // MARK: - Private Properties

    private let store: PersistentValueStore<Value>

    // MARK: - Public Properties

    public var wrappedValue: Value? {
        get {
            store.load()
        }
        set {
            if let newValue {
                store.save(value: newValue)
            } else {
                store.erase()
            }
        }
    }

    public var projectedValue: DataCleanerCompatible {
        return store
    }

    // MARK: - Init

    init(store: DataStore, dataConverter: any DataConverter) {
        self.store = PersistentValueStore(store: store, dataConverter: dataConverter)
    }

}
