import Combine

protocol TitlesProvider {
    var processing: AnyPublisher<Void, Never> { get }
    var titles: AnyPublisher<Result<[String], any Error>, Never> { get }
}

@objc
protocol TitlesUnitInput: AnyObject {
    func requestTitles()
    func selectTitle(_ title: String)
}

final class TitlesUnit: TitlesProvider, TitlesUnitInput {

    private let requestSubject: PassthroughSubject<Void, Never> = .init()
    private let selectTitleSubject: PassthroughSubject<String, Never> = .init()
    private let titlesSubject: CurrentValueSubject<[String]>, Never> = .init(.success([]))

    private let service: TitlesService
    private let storage: any ValueStore<String>

    init(service: TitlesService, storage: any ValueStore<String>) {
        self.service = service
        self.storage = storage
    }

    // MARK: - TitlesProvider

    var processing: AnyPublisher<Void, Never> {
        return selectTitleSubject
            .flatMap { title in
                titlesSubject.first(where: { $0 == title })
            }
            .handleEvents(receiveOutput: { [weak self] title in
                storage.save(value: title)
            })
            .map { _ in }
            .eraseToAnyPublisher()
    }

    var titles: AnyPublisher<Result<[String], any Error>, Never> {
        return requestSubject.flatMap { _ in
            return service.getTitles()
        }.handleEvents(receiveOutput: { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titlesSubject.send(titles)
            case .failure:
                break
            }
        }).eraseToAnyPublisher()
    }

    // MARK: - TitlesUnitInput

    func requestTitles() {
        requestSubject.send(())
    }

    func selectTitle(_ title: String) {
        selectTitleSubject.send(title)
    }

}
