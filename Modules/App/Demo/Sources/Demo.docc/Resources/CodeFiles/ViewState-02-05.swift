import Combine

protocol TitlesProvider {
    var processing: AnyPublisher<Void, Never> { get }
    var titles: AnyPublisher<Result<[String], any Error>, Never> { get }
    var isLoading: AnyPublisher<Bool, Never> { get }
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
    private let isLoadingValueSubject: CurrentValueSubject<Bool, Never> = .init(false)

    private let service: TitlesService
    private let storage: any ValueStore<String>

    init(service: TitlesService, storage: any ValueStore<String>) {
        self.service = service
        self.storage = storage
    }

    // MARK: - TitlesProvider

    var isLoading: AnyPublisher<Bool, Never> {
        return isLoadingValueSubject.eraseToAnyPublisher()
    }

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
        return requestSubject
            .handleEvents(receiverOutput: { [weak self] _ in
                self?.isLoadingValueSubject.send(true)
            })
            .flatMap { _ in
                return service.getTitles()
        }.handleEvents(receiveOutput: { [weak self] result in
            self?.isLoadingValueSubject.send(false)
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
