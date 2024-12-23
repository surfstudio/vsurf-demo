import SwiftUI

struct TestView: View {

    @StateObject private var textHolder: TestViewStateHolder = ""

    var body: some View {
        TutorForm(text: $textHolder.text)
    }
}

final class TextHolder: ObservableObject {
    @Published var text: String = ""
}
