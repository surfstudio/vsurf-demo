import SwiftUI

struct TutorForm: View {

    @State private var text: String = ""

    init(text: String) {
        self._text = State(initialValue: text)
    }

    var body: some View {
        VStack {
            TextField(text: $text,
                      label: {
                Text("Введите текст")
            })
        }.onChanged(of: text) { newValue in
            debugPrint("Text changed to \(newValue)")
        }
    }
}
