import SwiftUI

final class TutorScreenStateHolder: ObservableObject {
    @Published var state: UniversalViewState<[String]> = .loading
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
