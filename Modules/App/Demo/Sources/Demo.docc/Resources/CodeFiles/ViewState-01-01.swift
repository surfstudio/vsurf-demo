import SwiftUI

struct TutorScreen: View {

    @State private var titles: [String] = [
        "View",
        "State",
        "Unit",
        "Router",
        "Factory"
    ]

    var body: some View {
        List {
            ForEach(titles, id: \.self) { title in
                Text(title)
            }
        }
    }
}
