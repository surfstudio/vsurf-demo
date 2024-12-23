//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import Resources
import SwiftUI

public struct FloatingHintTextField: View {

    // MARK: - Environment

    @Environment(\.isEnabled)
    private var isEnabled
    @Environment(\.floatingTextFieldStyle)
    private var style
    @Environment(\.hint)
    public var hint
    @Environment(\.secondaryHint)
    public var secondHint

    // MARK: - Metrics

    @ScaledMetric private var leadingTrailingOffset: CGFloat = 12
    @ScaledMetric private var topOffset: CGFloat = 16
    @ScaledMetric private var bottomOffset: CGFloat = 8

    // MARK: - States

    @Binding var formattedText: String
    @State var text: String
    @State var error: String?
    @FocusState var isFocused: Bool

    // MARK: - Properties

    public let validator: TextValidator
    public let formatter: TextFormatter

    // MARK: - Computed States

    private var isFloating: Bool {
        return isFocused || !text.isEmpty
    }

    private var fieldState: TextFieldState {
        return .getState(isEnabled: isEnabled,
                         hasError: error != nil)
    }

    // MARK: - Init

    public init(formattedText: Binding<String>,
                initialText: String,
                validator: TextValidator = TextValidatorFactory.alwaysValid(),
                formatter: TextFormatter = TextFormatterFactory.noChange()) {
        self._formattedText = formattedText
        self._text = .init(initialValue: initialText)
        self._error = .init(initialValue: nil)
        self.validator = validator
        self.formatter = formatter
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading) {
            AnyView(style.makeContent(AnyView(
                ZStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        hintText()
                        if isFloating {
                            secondHintText()
                        }
                    }.foregroundStyle(error == nil ? style.hintColor.color : style.errorColor.color)
                    field()
                }
            ), for: fieldState))
            if let error {
                errorText(error)
            }
        }
        .animation(Animation.easeInOut, value: error)
        .animation(Animation.easeIn, value: isFocused)
    }

}

// MARK: - Private

private extension FloatingHintTextField {

    @ViewBuilder
    func hintText() -> some View {
        Text(hint)
            .padding([.leading, .trailing], leadingTrailingOffset)
            .font(isFloating ? style.floatingHintFont : style.hintFont)
    }

    @ViewBuilder
    func secondHintText() -> some View {
        Text(secondHint)
            .padding([.leading, .trailing], leadingTrailingOffset)
            .font(style.hintFont)
            .opacity(text.isEmpty ? 1 : 0)
    }

    @ViewBuilder
    func field() -> some View {
        TextField("", text: $text, onEditingChanged: { isEditing in
            if isEditing {
                // сброс ошибки
                error = nil
            } else {
                // валидация при завершении редактирования
                error = validator.validate(text: text).errorText
            }
        })
            .padding([.leading, .trailing], leadingTrailingOffset)
            .padding([.top], topOffset)
            .padding([.bottom], bottomOffset)
            .focused($isFocused)
            .onChange(of: text) { text in
                // сброс ошибки
                error = nil
                // сравниваем значения, чтобы форматирование не вызывалось лишний раз
                guard text.count != formattedText.count else {
                    return
                }
                let formattedText = formatter.format(text: text)
                self.formattedText = formattedText
                self.text = formattedText
            }
    }

    @ViewBuilder
    func errorText(_ text: String) -> some View {
        Text(text)
            .font(style.errorFont)
            .foregroundStyle(style.errorColor.color)
            .padding([.leading, .trailing], leadingTrailingOffset)
    }

}

// MARK: - Preview

struct FloatingHintTextField_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case phone
        case email
        case other
    }

    static var previews: some View {
        VStack {
            snapshots.previews
        }
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .phone:
                return FloatingHintTextField(formattedText: .constant(""),
                                             initialText: "",
                                             validator: TextValidators {
                    $0.nonEmpty()
                },
                                             formatter: TextFormatters {
                    $0.phoneMask(mask: FieldConstants.Phone.Mask.russian)
                })
                .padding()
                .keyboardType(.phonePad)
                .hint("Phone number")
                .secondaryHint("+7 (")
                .floatingTextFieldStyle(.rounded)
            case .email:
                return FloatingHintTextField(formattedText: .constant(""),
                                             initialText: "",
                                             validator: TextValidators {
                    $0.nonEmpty()
                    $0.maxLength(FieldConstants.Email.maxLength)
                    $0.regex(FieldConstants.Email.regex)
                },
                                             formatter: TextFormatters {
                    $0.trimming(.whitespaces)
                })
                .padding()
                .keyboardType(.emailAddress)
                .hint("Email")
                .secondaryHint(" ")
                .floatingTextFieldStyle(.bordered)
            case .other:
                return FloatingHintTextField(formattedText: .constant(""),
                                             initialText: "",
                                             validator: AlwaysValidTextValidator(),
                                             formatter: TextFormatters {
                    $0.capitalized()
                })
                .padding()
                .keyboardType(.default)
                .hint("Any text")
                .secondaryHint(" ")
                .floatingTextFieldStyle(.underlined)
            }
        })
    }
}
