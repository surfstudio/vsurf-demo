# Resources

@Metadata {
    @PageKind(article)
    @Available(iOS, introduced: "16.0")
}

В данном модуле хранятся картинки, шрифты, локализация, цвета.

## Кодогенерация

SwiftGen генерирует код для ресурсов из xcassets, локализации и шрифтов.

SwiftGen устанавливается через `brew` на одном из шагов в `make init`.

Если вы по какой-то причине упустили этот шаг, можете вызвать установку brew вручную
```shell
make install.brews
```

## Ручная

@Row(numberOfColumns: 2) {
    
    @Column {
        Запуск из папки с `Package.swift`:
        ```shell
        swiftgen
        ```
    }
    
    @Column {
        Запуск из корня проекта:
        ```shell
        make swiftgen
        ```
    }
    
}

## Автоматическая

- Warning: На данный момент автоматическая генерация не поддерживается. SwiftgenPlugin и RunScriptPlugin либо не находят бинарик, либо имеют проблемы с разрешениями на Xcode 15.4.

### Кастомный шаблон для xcassets

Для поддержки изменения цветовой схемы в приложении был создан кастомный шаблон для генерации кода из xcassets.

Конфигурация выглядит так
```yml
xcassets:
  inputs:
    - Images.xcassets
    - Colors.xcassets
  outputs:
    - templatePath: Templates/xcassets/swift5+colorThemes.stencil
      params:
        forceProvidesNamespaces: false
        publicAccess: true
        colorThemes:
          - BaseTheme
          - PinkTheme
        defaultColorTheme: BaseTheme
      output: Assets.swift
```

В Colors.xcassets цвета разных тем группируются в папки с названием `{Name}Theme`. Суффикс `Theme` обязателен.

#### Параметры

##### colorThemes
Список тем. Должен соответствовать темам в xcassets.

##### defaultColorTheme

Тема по умолчанию. Именно по ней будет формироваться enum и static property в результирующем файле.

#### Результат

##### Смена темы

```swift
ColorTheme.current = .someCustomTheme
```

##### Доступ к цвету

```swift
Asset.Colors.someColor.color
// или
Asset.Colors.someColor.uiColor
```

## Возможные проблемы

### SwiftUI.Preview ругаются на resource

@TabNavigator {
    @Tab("Ошибка") {
        Вы наполняете какое-то SwiftUI.View, но preview не собираются со следующей ошибкой
        
        @Image(source: Preview_Resources_Error.png, alt: "Ошибка"):
    }
    @Tab("Решение") {
        Выберете в качестве целевого девайса iPhone.
        
        @Image(source: Preview_Resources_Solution.png, alt: "Решение"):
        
        Xcode собирает весь проект для подготовки Preview. Если он не может собрать ваш iOS проект на mac или Any iOS Device предназначенный для архивов, неудивительно что превью не работают.
    }
    @Tab("Ложное решение") {
        В интернете вы можете найти решение с переопределением `Bundle` (см. [StackOv: 64540082](https://stackoverflow.com/questions/64540082/xcode-12-swiftui-preview-doesnt-work-on-swift-package-when-have-another-swift/65789298#65789298))
        
        Это решение не самое лучшее потому что оно переопределяет `Bundle` для всего проекта, что может привести к неожиданным побочным эффектам.
        
        Кроме того, потребуется менять шаблон генерации [](Templates/xcassets/swift5+colorThemes.stencil).
        
        Так или иначе решение работает и позволяет ошибиться в выборе девайса, но по сути с таким вариантом мы боремся с последствиями, а не с причиной ошибки.
    }
}

