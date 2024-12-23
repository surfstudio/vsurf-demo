# Уровень модулей Core

@Metadata {
    @PageKind(article)
    @Available(iOS, introduced: "16.0")
}

Ядро с утилитами и расширениями примитивов.

## Зависимости

- Сторонние библиотеки, необходимые для создания утилит и расширений

Чем меньше сторонних зависимостей, тем лучше. Запомните это правило. Оно справедливо для всех уровней модулей.

## Типы тестов

- Unit тесты

## Примеры модулей
- [Core](Modules/Core/Core/README.md)

Обратите внимание на таргет `CoreTestsSupport`. 
Утилиты для Unit тестов не должны попадать в сборку приложения или модули с использованием `SwiftUI.Preview`. Поэтому их нужно выносить в отдельный таргет и продукт.