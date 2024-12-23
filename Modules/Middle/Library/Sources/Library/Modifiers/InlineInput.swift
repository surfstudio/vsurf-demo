//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

// MARK: - Modifiers

struct InlineDateInputModifier: ViewModifier {

    // MARK: - States

    @State var isShowing = false
    @Binding var date: Date

    // MARK: - Properties

    var range: ClosedRange<Date>
    var components: DatePickerComponents

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                hideKeyboard()
                isShowing.toggle()
            }
        if isShowing {
            DefaultDatePicker(date: $date,
                              range: range,
                              components: components)
            .animation(.easeIn, value: isShowing)
            .transition(.opacity)
            .zIndex(1)
        }
    }

}

struct InlinePickerInputModifier: ViewModifier {

    // MARK: - States

    @State var isShowing = false
    @Binding var selection: String

    // MARK: - Properties

    var sources: [String]

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                hideKeyboard()
                isShowing.toggle()
            }
        if isShowing {
            DefaultStringPicker(selection: $selection,
                                sources: sources)
        }
    }

}

// MARK: - Accessors

public extension View {
    /// Добавляет `DatePicker` в виде встроенного пикера
    ///  - Parameters:
    ///     - date: Связь выбранной даты с `State`/`Binding`  свойством.
    ///     - range: Диапазон дат.
    ///     - components: Компоненты редактирования. Дата + время или одно из них.
    ///  - Warning: Местоположение пикера будет зависеть от контейнера.
    ///  Например, если контейнер `VStack`,  то пикер будет расположен под целевой View.
    func inlineDateInput(date: Binding<Date>,
                         range: ClosedRange<Date>,
                         components: DatePickerComponents) -> some View {
        self.modifier(InlineDateInputModifier(date: date,
                                              range: range,
                                              components: components))
    }

    /// Добавляет `Picker` в виде встроенного
    /// - Parameters:
    ///   - selection: Связь выбранного элемента с `State`/`Binding`  свойством.
    ///   - sources: Массив источников данных для `Picker`.
    func inlinePickerInput(selection: Binding<String>,
                           sources: [String]) -> some View {
        self.modifier(InlinePickerInputModifier(selection: selection,
                                                sources: sources))
    }
}
