import Foundation
import SwiftUI

struct TutorView: View {

    @State var text: String = ""

    var body: some View {
        TextField(text: $text, label: {
            Text("")
        })
    }

}
