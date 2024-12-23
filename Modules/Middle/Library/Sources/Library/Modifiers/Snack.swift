//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

/// Структура данных для отображения всплывающего баннера
public struct SnackStyle {
    var foregroundColor: Color
    var backgroundColor: Color

    /// Стиль баннера ошибки
    public static func error() -> SnackStyle {
        SnackStyle(foregroundColor: Asset.Colors.Snack.text.color,
                   backgroundColor: Asset.Colors.Snack.errorBackground.color)
    }

    /// Стиль баннера успеха
    public static func success() -> SnackStyle {
        SnackStyle(foregroundColor: Asset.Colors.Snack.text.color,
                   backgroundColor: Asset.Colors.Snack.successBackground.color)
    }
}

/// Модификатор для отображения всплывающего баннера
struct SnackModifier: ViewModifier {

    @State var dismissTask: DispatchWorkItem?

    @Binding var message: String?
    var style: SnackStyle

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                if let message, !message.isEmpty {
                    VStack(alignment: .leading) {
                        Text(message)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .font(.paragraph2)
                            .foregroundColor(style.foregroundColor)
                            .padding()
                            .background(style.backgroundColor)
                            .cornerRadius(12)
                    }
                    .padding()
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut, value: self.message)
                    .zIndex(1)
                    .onTapGesture {
                        withAnimation {
                            self.message = nil
                        }
                    }.onAppear {
                        let dismissTask = DispatchWorkItem {
                            withAnimation {
                                self.message = nil
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3,
                                                      execute: dismissTask)
                        self.dismissTask = dismissTask
                    }
                    .onDisappear {
                        self.dismissTask?.cancel()
                    }
                }
            }
    }
}

public extension View {
    func snack(message: Binding<String?>, style: SnackStyle) -> some View {
        self.modifier(SnackModifier(message: message, style: style))
    }
}
