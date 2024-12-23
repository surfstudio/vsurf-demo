import Foundation
import SwiftUI

struct TutorView: View {

    @Environment(\.placeholderValue)
    var placeholderValue

    @State var text: String = ""

    var body: some View {
        TextField(text: $text, label: {
            Text(placeholderValue)
        })
    }

}
