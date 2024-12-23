//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import Resources
import SwiftUI

public struct FakeFloatingHintTextField: View {

    // MARK: - Environment

    @Environment(\.isEnabled)
    private var isEnabled
    @Environment(\.floatingTextFieldStyle)
    private var style
    @Environment(\.hint)
    public var hint

    // MARK: - Metrics

    @ScaledMetric private var leadingTrailingOffset: CGFloat = 12
    @ScaledMetric private var topOffset: CGFloat = 16
    @ScaledMetric private var bottomOffset: CGFloat = 8

    // MARK: - States

    @Binding var text: String
    @Binding var error: String?

    // MARK: - Computed States

    private var isFloating: Bool {
        return !text.isEmpty
    }

    private var fieldState: TextFieldState {
        return .getState(isEnabled: isEnabled,
                         hasError: error != nil)
    }

    // MARK: - Init

    public init(text: Binding<String>,
                error: Binding<String?>) {
        self._text = text
        self._error = error
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
                    HStack {
                        valueText()
                        arrowImage()
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
            ), for: fieldState))
            if let error {
                errorText(error)
            }
        }
        .animation(Animation.easeInOut, value: text.isEmpty)
        .animation(Animation.easeInOut, value: error)
    }

}

// MARK: - Private

private extension FakeFloatingHintTextField {

    @ViewBuilder
    func hintText() -> some View {
        Text(hint)
            .padding([.leading, .trailing], leadingTrailingOffset)
            .font(isFloating ? style.floatingHintFont : style.hintFont)
    }

    @ViewBuilder
    func secondHintText() -> some View {
        Text(" ")
            .padding([.leading, .trailing], leadingTrailingOffset)
            .font(style.hintFont)
            .opacity(text.isEmpty ? 1 : 0)
    }

    @ViewBuilder
    func valueText() -> some View {
        Text(text)
            .padding([.leading, .trailing], leadingTrailingOffset)
            .padding([.top], topOffset)
            .padding([.bottom], bottomOffset)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    func arrowImage() -> some View {
        Image(asset: Asset.Images.Icons.arrowRight)
            .renderingMode(.template)
            .foregroundStyle(Asset.Colors.Text.secondary.color)
            .rotationEffect(.degrees(90))
            .padding([.leading, .trailing], leadingTrailingOffset)
            .padding([.top], topOffset)
            .padding([.bottom], bottomOffset)
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

struct FakeFloatingHintTextField_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case birthday
        case sex
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
            case .birthday:
                return FakeFloatingHintTextField(text: .constant(""),
                                                 error: .constant(nil))
                .padding()
                .hint(FieldConstants.Birthday.placeholder)
                .floatingTextFieldStyle(.rounded)
            case .sex:
                return FakeFloatingHintTextField(text: .constant("Жен"),
                                                 error: .constant(nil))
                .padding()
                .hint(FieldConstants.Sex.placeholder)
                .floatingTextFieldStyle(.rounded)
            }
        })
    }
}
