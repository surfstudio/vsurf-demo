//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SurfCore

/// Перечисление возможных исключений. Используйте для дефолтных моделей ``ExceptionView``
public enum Exceptions {

    // MARK: - Nested

    /// Перечисление обрабатываемых ошибок
    public enum ErrorCase {
        /// Общая ошибка.
        case general
        /// Ошибка с интернет соединением.
        case internet
    }

    /// Перечисление контекстов операций
    public enum EmptyCase {
        /// Общий контекст для многих flow
        case general
        /// Контекст поиска города
        case city
    }

    // MARK: - Cases

    /// Исключение порожденное ошибкой при выполнении операции
    /// - Parameters:
    ///    - reason: Причина возникновения ошибки
    ///    - action: Действие повтора операции
    case error(reason: ErrorCase, action: EmptyClosure)
    /// Исключение порожденное отсутствием результата после выполнения операции
    /// - Parameters:
    ///    - reason: Контекст или тип операции
    case empty(reason: EmptyCase)

    // MARK: - Factory

    var model: ExceptionView.Model {
        switch self {
        case .empty(let subCase):
            return emptyModel(for: subCase)
        case .error(let subCase, let action):
            return errorModel(for: subCase, with: action)
        }
    }

}

// MARK: - Private

private extension Exceptions {

    func emptyModel(for subCase: EmptyCase) -> ExceptionView.Model {
        switch subCase {
        case .general:
            return .init(title: L10n.Localizable.EmptyState.Shared.title,
                         message: L10n.Localizable.EmptyState.Shared.description)
        case .city:
            return .init(title: L10n.Localizable.Shared.MultiStates.Empty.CitySearch.title,
                         message: L10n.Localizable.Shared.MultiStates.Empty.CitySearch.message)
        }
    }

    func errorModel(for subCase: ErrorCase, with action: @escaping EmptyClosure) -> ExceptionView.Model {
        switch subCase {
        case .general:
            return .init(title: L10n.Localizable.Error.MultiStates.Other.title,
                         message: L10n.Localizable.Error.MultiStates.Other.message,
                         action: .init(title: L10n.Localizable.Error.MultiStates.Other.button,
                                       action: action)
            )
        case .internet:
            return .init(title: L10n.Localizable.Error.MultiStates.Internet.title,
                         message: L10n.Localizable.Error.MultiStates.Internet.message,
                         action: .init(title: L10n.Localizable.Error.MultiStates.Internet.button,
                                       action: action)
            )
        }
    }

}
