//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

/// Возможные состояния экрана, каждому из которых
/// соответствует определенное состояние в дефолтной реализации MultiStatesPresenter протокола
public enum UniversalViewState<T> {
    case error(ExceptionView.Model)
    case loading
    /// при установке normal стейта - все view от остальных стейтов будут убраны с экрана
    case normal(model: T)

    // MARK: - Building

    @ViewBuilder
    public func buildView(_ content: (T) -> some View) -> some View {
        switch self {
        case .error(let model):
            ExceptionView(model: model)
        case .loading:
            VStack(alignment: .center) {
                Spacer()
                    .frame(maxHeight: .infinity)
                ProgressView()
                Spacer()
                    .frame(maxHeight: .infinity)
            }
        case .normal(let model):
            content(model)
        }
    }
}
