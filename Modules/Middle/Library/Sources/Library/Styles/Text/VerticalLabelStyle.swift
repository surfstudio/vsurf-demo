//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

/// Стиль при котором текст находится под иконкой
public struct VerticalLabelStyle: LabelStyle {

    // MARK: - Properties

    let alignment: HorizontalAlignment
    let spacing: CGFloat

    // MARK: - Init

    /// - Parameters:
    ///   - alignment: Выравнивание элементов по горизонтали
    ///   - spacing: Отступ между иконкой и текстом
    public init(alignment: HorizontalAlignment = .center,
                spacing: CGFloat = 8) {
        self.alignment = alignment
        self.spacing = spacing
    }

    // MARK: - LabelStyle

    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: alignment, spacing: spacing) {
            configuration.icon
            configuration.title
        }
    }

}
