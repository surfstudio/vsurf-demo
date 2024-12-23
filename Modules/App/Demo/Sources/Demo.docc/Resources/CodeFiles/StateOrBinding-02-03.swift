import SwiftUI

struct TestView: View {

    @State private var text: String = ""

    var body: some View {
        TutorForm(text: $text)
    }
}
