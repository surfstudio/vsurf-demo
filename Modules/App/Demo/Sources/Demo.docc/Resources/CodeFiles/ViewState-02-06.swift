import SwiftUI
import Combine

final class TutorScreenStateHolder: ObservableObject {
    private var cancellable = Set<AnyCancellable>()
    private weak var titlesProvider: (TitlesProvider & TitlesUnitInput)?

    @Published var state: UniversalViewState<[String]> = .loading

    init(titlesProvider: TitlesProvider & TitlesUnitInput) {
        self.titlesProvider = titlesProvider
        self.subscribe()
    }
}

private extension TutorScreenStateHolder {

    func subscribe() {
        titlesProvider?.titles
            .map { result in
                switch result {
                case .success(let titles):
                    return .normal(model: titles)
                case .failure(let error):
                    return .normal(model: [])
                }
            }
            .receive(on: DispatchQueue.main)
            .assign(to: \.state, on: self)
            .store(in: &cancellable)

        titlesProvider?.processing
            .sink { _ in }
            .store(in: &cancellable)
    }

}
