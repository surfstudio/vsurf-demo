import Combine

protocol TitlesProvider {
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

    private let service: TitlesService

    init(service: TitlesService) {
        self.service = service
    }

    // MARK: - TitlesProvider

    var titles: AnyPublisher<Result<[String], any Error>, Never> {
        return requestSubject.flatMap { _ in
            return service.getTitles()
        }.eraseToAnyPublisher()
    }

    // MARK: - TitlesUnitInput

    func requestTitles() {
        requestSubject.send(())
    }

    func selectTitle(_ title: String) {
        selectTitleSubject.send(title)
    }

}
