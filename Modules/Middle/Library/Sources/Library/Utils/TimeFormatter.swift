//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Resources
import Utils

/// Простенький форматтер для преобразование количества секунд в строку вида "1 минуту 25 секунд"
public final class TimeFormatter {

    // MARK: - Nested Types

    typealias TimeComponents = (hours: Int, minutes: Int, seconds: Int)

    // MARK: - Initialization

    public init() {}

    // MARK: - Public Methods

    public func format(_ seconds: Int) -> String {
        let components = buildTimeComponents(from: seconds)
        return formatForTimer(with: components)
    }

}

// MARK: - Private Methods

private extension TimeFormatter {

    func buildTimeComponents(from seconds: Int) -> TimeComponents {
        let hours = seconds / 3600
        let minutes = (seconds - hours * 3600) / 60
        let seconds = seconds % 60
        return (hours, minutes, seconds)
    }

    func formatForTimer(with components: TimeComponents) -> String {
        let minutes = L10n.LocalizablePlural.Time.After.minutes(components.minutes)
        let seconds = L10n.LocalizablePlural.Time.After.seconds(components.seconds)

        return components.minutes > 0 ? minutes + " " + seconds : seconds
    }

}
