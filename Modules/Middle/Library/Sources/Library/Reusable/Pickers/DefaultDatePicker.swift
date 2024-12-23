//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

struct DefaultDatePicker: View {

    // MARK: - States

    @Binding var date: Date

    // MARK: - Properties

    var range: ClosedRange<Date>
    var components: DatePickerComponents

    // MARK: - Init

    init(date: Binding<Date>,
         range: ClosedRange<Date>,
         components: DatePickerComponents) {
        self._date = date
        self.range = range
        self.components = components
    }

    // MARK: - View

    var body: some View {
        DatePicker(selection: $date,
                   in: range,
                   displayedComponents: components) { EmptyView() }
        .labelsHidden()
        .datePickerStyle(.wheel)
    }

}
