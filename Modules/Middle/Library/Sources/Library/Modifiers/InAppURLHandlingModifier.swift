//
//  Copyright © Surf. All rights reserved.
//

import SafariServices
import SwiftUI

/// Wrapper для `SFSafariViewController`, чтобы использовать его в SwiftUI.
struct SafariWebView: UIViewControllerRepresentable {

    // MARK: - Private Properties

    private let url: URL

    // MARK: - Init

    init(url: URL) {
        self.url = url
    }

    // MARK: - UIViewControllerRepresentable

    func makeUIViewController(context _: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_: SFSafariViewController, context _: Context) {}

}

/// Отслеживает `openURL` и перехватывает ссылки,
/// чтобы открывать их внутри приложения,
/// а не во внешнем браузере.
private struct InAppURLHandlingModifier: ViewModifier {
    @State private var urlToOpen: URL?

    func body(content: Content) -> some View {
        content
            .environment(\.openURL, OpenURLAction { url in
                urlToOpen = url
                return .handled
            })
            .sheet(isPresented: $urlToOpen.mapToBool(),
                   onDismiss: {
                urlToOpen = nil
            },
                   content: {
                if let urlToOpen {
                    SafariWebView(url: urlToOpen)
                        .ignoresSafeArea()
                }
            })
    }
}

public extension View {
    /// Отслеживает `openURL` и перехватывает ссылки,
    /// чтобы открывать их внутри приложения,
    /// а не во внешнем браузере.
    ///
    /// - Note: Прикрепляется к environment, так что можно ограничить область перехвата ссылок.
    func handleOpenURLInApp() -> some View {
        modifier(InAppURLHandlingModifier())
    }
}
