import Foundation
import SwiftUI

struct FormView: View {

    var body: some View {
        VStack {
            TutorView()
                .placeholderValue("Фамилия")
            TutorView()
                .placeholderValue("Имя")
            TutorView()
                .placeholderValue("Отчество")
        }
    }

}
