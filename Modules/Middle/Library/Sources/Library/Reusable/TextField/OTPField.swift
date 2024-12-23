//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import Resources
import SwiftUI

/// Вьюшка для ввода one-time-password (OTP)
public struct OTPField: View {

    // MARK: - Environment

    @Environment(\.isEnabled)
    private var isEnabled
    @Environment(\.otpFieldStyle)
    private var style

    // MARK: - Metrics

    @ScaledMetric var width: CGFloat = 24

    // MARK: - States

    @FocusState private var focusedPin: Int?
    @Binding private var password: String
    @Binding private var hasError: Bool
    @State private var pins: [String]

    // MARK: - Properties

    private let pinFormatter: TextFormatter
    private let passwordFormatter: TextFormatter
    private let shakeDuration: TimeInterval = 0.25

    // MARK: - Computed Properties

    private var fieldState: TextFieldState {
        return .getState(isEnabled: isEnabled,
                         hasError: hasError)
    }

    // MARK: - Init

    /// - Parameters:
    ///  - password: Биндинг с паролем. Либо пустой, либо полный введенный пароль.
    ///  - hasError: Биндинг с ошибкой.
    ///  Используйте для сброса пинов и анимации тряски в случае неправильно введенного кода.
    ///  - codeLength: Длина пароля..
    public init(password: Binding<String>,
                hasError: Binding<Bool>,
                codeLength: UInt) {
        self._password = password
        self._hasError = hasError
        self._pins = .init(initialValue: (0..<codeLength).map { _ in "" })
        self.pinFormatter = TextFormatters {
            $0.digits()
            $0.prefix(1)
        }
        self.passwordFormatter = TextFormatters {
            $0.digits()
            $0.prefix(Int(codeLength))
        }
    }

    // MARK: - Body

    public var body: some View {
        HStack(alignment: .center, spacing: 16) {
            ForEach(pins.indices) { index in
                field(at: index)
            }
        }
        .keyboardType(.numberPad)
        .frame(maxWidth: .infinity)
        .onAppear(perform: {
            updatePins(with: password)
        })
        .onTapGesture {
            focusedPin = pins.firstIndex(where: { $0.isEmpty })
        }
        .onChange(of: hasError) { hasError in
            guard hasError else {
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + shakeDuration) {
                self.resetPins()
                self.hasError = false
            }
        }
        .shake(isShaking: $hasError, duration: shakeDuration)
        .onReceive(pins.publisher
            .reduce("", +)
            .map { $0.digits }
            .filter { $0.count == pins.count }
            .throttle(for: .milliseconds(250), scheduler: DispatchQueue.main, latest: true),
                   perform: { pins in
            password = pins
        })
    }

}

// MARK: - Private Methods

private extension OTPField {

    func resetPins() {
        password.removeAll()
        for index in 0..<pins.count {
            pins[index] = ""
        }
    }

    func updatePins(with password: String) {
        let otpArray = String(password.prefix(pins.count)).map { String($0) }
        pins.replaceSubrange(otpArray.indices, with: otpArray)
    }

    func updatePin(value: String, at index: Int) {
        // TODO: - Решить известные проблемы со вставкой и удалением https://jira.surf.dev/browse/SNP-1432
        switch value.count {
        case .zero:
            // удаление = перемещаем фокус на предыдущее поле
            if index > 0 {
                focusedPin = index - 1
            }
        case 1:
            // написали один символ
            if index < pins.count - 1 {
                // перемещаем фокус вперед
                focusedPin = index + 1
            }
        case 2..<pins.count:
            // вставка части кода
            // пытаемся дозаполнить все поля
            let currentFilledDigits = pins.joined().digits
            let maxPossibleDigits = (currentFilledDigits + value.digits).prefix(pins.count)
            updatePins(with: passwordFormatter.format(text: String(maxPossibleDigits)))
            // фокусируемся на последнем заполненом
            focusedPin = password.count - 1
        case pins.count:
            // вставка целого кода
            updatePins(with: passwordFormatter.format(text: value))
            // фокусируемся на последнем
            focusedPin = pins.count - 1
        default:
            break
        }
    }

    @ViewBuilder
    func field(at index: Int) -> some View {
        AnyView(style.makeItem(AnyView(
            TextField("", text: $pins[index])
                .multilineTextAlignment(.center)
                .frame(maxWidth: width)),
                               for: fieldState)
        )
        .formatInput($pins[index], with: pinFormatter)
        .onChange(of: pins[index]) { newValue in
            updatePin(value: newValue, at: index)
        }
        .focused($focusedPin, equals: index)
    }
}

// MARK: - Preview

struct OTPField_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case roundedSix
        case roundedSixError
        case borderedFour
        case borderedFourError
    }

    static var previews: some View {
        snapshots.previews
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .roundedSix:
                // VStack нужен для работы фокуса в превью
                VStack(alignment: .center, spacing: 8) {
                    OTPField(password: .constant(""),
                             hasError: .constant(false),
                             codeLength: 6)
                }
                .otpFieldStyle(.rounded)
            case .roundedSixError:
                VStack(alignment: .center, spacing: 8) {
                    OTPField(password: .constant("111111"),
                             hasError: .constant(true),
                             codeLength: 6)
                }
                .otpFieldStyle(.rounded)
            case .borderedFour:
                VStack(alignment: .center, spacing: 8) {
                    OTPField(password: .constant(""),
                             hasError: .constant(false),
                             codeLength: 4)
                }
                .otpFieldStyle(.bordered)
            case .borderedFourError:
                VStack(alignment: .center, spacing: 8) {
                    OTPField(password: .constant("1111"),
                             hasError: .constant(true),
                             codeLength: 4)
                }
                .otpFieldStyle(.bordered)
            }
        })
    }
}
