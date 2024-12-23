//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

public extension Binding {
    /// Трансформирует binding со строкой в `Date`, используя `DateFormatter`.
    func mapToDate(with formatter: DateFormatter) -> Binding<Date> where Value == String {
        .init(get: {
            formatter.date(from: self.wrappedValue) ?? Date()
        },
              set: { date in
            self.wrappedValue = formatter.string(from: date)
        })
    }
}
