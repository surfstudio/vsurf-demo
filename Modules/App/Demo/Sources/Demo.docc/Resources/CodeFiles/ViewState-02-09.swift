import SwiftUI

struct TutorScreen: View {

    struct ViewState {
        let titles: [String]
    }

    @Binding private var viewState: UniversalViewState<[String]>

    init(viewState: Binding<UniversalViewState<[String]>>) {
        self._viewState = viewState
    }

    var body: some View {
        viewState.buildView {
            List {
                ForEach($0, id: \.self) { title in
                    Button {
                        debugPrint("Выбран элемент: \(title)")
                    } label: {
                        Text(title)
                    }
                }
            }
        }
    }
}

public struct TutorViewGroup: View {

    private let titlesUnit: TitlesUnit

    @StateObject private var viewStateHolder: TutorScreenStateHolder

    public init() {
        let titlesUnit = TitlesStateModuleFacade.titlesUnit
        self._viewStateHolder = .init(wrappedValue: .init(titlesProvider: titlesUnit))
        self.titlesUnit = titlesUnit
    }

    public var body: some View {
        TutorScreen(state: viewStateHolder.state)
    }

}
