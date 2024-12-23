import SwiftUI

final class TutorScreenStateHolder: ObservableObject {
    @Published var state: UniversalViewState<[String]> = .loading

    func fetchTitles() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if Bool.random() {
                self.state = .normal(model: [
                    "View",
                    "State",
                    "Unit",
                    "Router",
                    "Factory"
                ])
            } else {
                self.state = .error(
                    ExceptionView.Model(title: "Ошибка",
                                        message: "Не удалось загрузить заголовки",
                                        action: ExceptionView.Action(title: "Повторить",
                                                                     action: {
                    self?.fetchTitles()
                }
            }
        }
    }
}

struct TutorScreen: View {

    @Binding private var viewState: UniversalViewState<[String]>

    init(viewState: Binding<UniversalViewState<[String]>>) {
        self._viewState = viewState
    }

    var body: some View {
        viewState.buildView {
            List {
                ForEach($0, id: \.self) { title in
                    Text(title)
                }
            }
        }
    }
}

public struct TutorViewGroup: View {

    @StateObject private var viewStateHolder: TutorScreenStateHolder

    public init() {
        self._viewStateHolder = .init(wrappedValue: .init())
    }

    public var body: some View {
        TutorScreen(state: viewStateHolder.state)
    }

}
