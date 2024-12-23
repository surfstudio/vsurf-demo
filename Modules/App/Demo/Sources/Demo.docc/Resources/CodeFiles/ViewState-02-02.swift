import Combine

protocol TitlesProvider {
    var titles: AnyPublisher<Result<[String], any Error>, Never> { get }
}

final class TitlesUnit: TitlesProvider {

    private let service: TitlesService

    init(service: TitlesService) {
        self.service = service
    }

    // MARK: - TitlesProvider

    var titles: AnyPublisher<Result<[String], any Error>, Never> {
        return service.getTitles()
    }

}
