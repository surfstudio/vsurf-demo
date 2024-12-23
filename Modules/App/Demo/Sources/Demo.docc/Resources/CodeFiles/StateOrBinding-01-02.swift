import SwiftUI

struct TutorForm: View {

    @State private var text: String = ""

    init(text: String) {
        self.text = text
    }

    var body: some View {
        VStack {
            TextField(text: $text,
                      label: {
                Text("Введите текст")
            })
        }
    }
}
