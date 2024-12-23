//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

struct DefaultStringPicker: View {

    // MARK: - States

    @Binding var selection: String

    // MARK: - Properties

    var sources: [String]

    // MARK: - Init

    init(selection: Binding<String>,
         sources: [String]) {
        self._selection = selection
        self.sources = sources
    }

    // MARK: - View

    var body: some View {
        Picker(selection: $selection,
               content: {
                    ForEach(sources, id: \.self) {
                        Text($0)
                    }
               },
               label: { EmptyView() }
        )
        .pickerStyle(.wheel)
        .labelsHidden()
    }
}
