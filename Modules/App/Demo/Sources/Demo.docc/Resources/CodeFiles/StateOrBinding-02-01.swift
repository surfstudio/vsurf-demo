import SwiftUI

struct TutorForm: View {

    @Binding private var text: String

    init(text: Binding<String>) {
        self._text = text
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
