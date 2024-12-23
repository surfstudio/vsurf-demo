import SwiftUI

struct TutorForm: View {

    @State private var text: String = ""

    var body: some View {
        VStack {
            TextField(text: $text,
                      label: {
                Text("Введите текст")
            })
        }
    }
}
