import Foundation
import SwiftUI

struct FormView: View {

    var body: some View {
        VStack {
            TutorView()
            TutorView()
            TutorView()
        }.placeholderValue("Введите текст")
    }

}
