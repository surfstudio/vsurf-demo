import SwiftUI

struct TutorScreen: View {

    struct ViewState {
        let titles: [String]
    }

    @State private var viewState: ViewState = .init(titles: [
        "View",
        "State",
        "Unit",
        "Router",
        "Factory"
    ])

    var body: some View {
        List {
            ForEach(viewState.titles, id: \.self) { title in
                Text(title)
            }
        }
    }
}
