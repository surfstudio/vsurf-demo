//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

// MARK: - Preferences

struct InnerHeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// MARK: - Modifiers

struct SheetHeightModifier: ViewModifier {

    // MARK: - States

    @Binding var sheetHeight: CGFloat

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                }
            }
            .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                sheetHeight = newHeight
            }
    }

}

struct SheetDateInputModifier: ViewModifier {

    // MARK: - States

    @State private var sheetHeight: CGFloat = .zero
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
            }.sheet(isPresented: $isShowing, content: {
                DefaultDatePicker(date: $date,
                                  range: range,
                                  components: components)
                .modifier(SheetHeightModifier(sheetHeight: $sheetHeight))
                .presentationDetents([.height(sheetHeight)])
            })
    }

}

struct SheetPickerInputModifier: ViewModifier {

    // MARK: - States

    @State private var sheetHeight: CGFloat = .zero
    @State var isShowing = false
    @State var detent: PresentationDetent = .medium
    @Binding var selection: String

    // MARK: - Properties

    var sources: [String]

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                hideKeyboard()
                isShowing.toggle()
            }.sheet(isPresented: $isShowing, content: {
                DefaultStringPicker(selection: $selection,
                                    sources: sources)
                .modifier(SheetHeightModifier(sheetHeight: $sheetHeight))
                .presentationDetents([.medium, .height(sheetHeight)], selection: $detent)
            })
    }

}

// MARK: - Accessors

public extension View {
    /// Добавляет `DatePicker` в виде модального окна
    /// - Parameters:
    ///    - date: Связь выбранной даты с `State`/`Binding`  свойством.
    ///    - range: Диапазон дат.
    ///    - components: Компоненты редактирования. Дата + время или одно из них.
    func sheetDateInput(date: Binding<Date>,
                        range: ClosedRange<Date>,
                        components: DatePickerComponents) -> some View {
        self.modifier(SheetDateInputModifier(date: date,
                                             range: range,
                                             components: components))
    }

    /// Добавляет `Picker` в виде модального окна
    /// - Parameters:
    ///   - selection: Связь выбранного элемента с `State`/`Binding`  свойством.
    ///   - sources: Массив источников данных для `Picker`.
    func sheetPickerInput(selection: Binding<String>,
                          sources: [String]) -> some View {
        self.modifier(SheetPickerInputModifier(selection: selection,
                                               sources: sources))
    }
}
