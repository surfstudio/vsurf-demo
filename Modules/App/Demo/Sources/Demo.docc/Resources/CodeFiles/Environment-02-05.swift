import Foundation
import SwiftUI

struct TutorView: View {

    var body: some View {
        TabBarView(items: StubItem.allCases,
                   selectedItem: .constant(StubItem.main))
        .tabBarViewStyle(.rounded)
    }

}