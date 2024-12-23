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
