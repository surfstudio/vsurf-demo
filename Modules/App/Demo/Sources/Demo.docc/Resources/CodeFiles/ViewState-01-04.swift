import SwiftUI

final class TutorScreenStateHolder: ObservableObject {
    @Published var state: ViewState = .init(titles: [])
}

struct TutorScreen: View {

    struct ViewState {
        let titles: [String]
    }

    @Binding private var viewState: ViewState

    init(viewState: Binding<ViewState>) {
        self._viewState = viewState
    }

    var body: some View {
        List {
            ForEach(viewState.titles, id: \.self) { title in
                Text(title)
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
