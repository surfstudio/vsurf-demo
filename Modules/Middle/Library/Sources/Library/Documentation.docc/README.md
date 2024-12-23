# Library

@Metadata {
    @PageKind(article)
    @Available(iOS, introduced: "16.0")
}

### Styles

#### Text

`Font+Styles` содержит все стили текста с макета.
Шрифт, размер и начертание. Выравнивания и цвета не учитываются, потому что это верстка.

- Note: Помните, что в SwiftUI модификатор шрифта распространяется на все дочерние элементы контейнеров, но преимущество имеет самый ближний к тексту модификатор шрифта.

Например следующие стеки будут отрисованы одинаково

@Row(numberOfColumns: 2) {
    @Column {
        ```swift
        VStack {
                HStack {
                    Text("Hello")
                    Text("World")
                }.font(.headline1)
                Text("PS").font(.paragraph3)
        }
        ```
    }
    
    @Column {
        ```swift
        VStack {
                HStack {
                    Text("Hello")
                    Text("World")
                }
                Text("PS").font(.paragraph3)
        }.font(.headline1)
        ```
    }
} 

## Label

`Label+Styles` содержит кастомные стили лейблов для переопределения расположения текста относительно иконки, добавления фона и тому подобное.

Применяется модификатором `.labelStyle()` к лейблу.
Дефолтный конструктор встроен в стандартную цепочку через extension.

Пример
```swift
Label("Label", systemImage: "star")
    .labelStyle(.vertical)
```

Стиль лейбла распространяется на все дочерние элементы контейнеров, но преимущество имеет самый ближний к лейблу модификатор стиля.

- Warning: В текущих реализациях стилей мы не настраиваем `font` или `foregroundStyle` а лишь управляем расположением элементов из конфигурации лейбла так как Label это стандартная View.

#### Button 

`Button+Styles` содержит все стили кнопок с макета.
Стиль кнопки включает шрифт, характер фона и динамические цвета.
Обрабатываются **normal**, **disabled** и **pressed** состояния.

Применяется модификатором `.buttonStyle()` к кнопке.

Пример
```swift
Button(action: {
    print("Button pressed")
}) {
    Text("Button")
}.buttonStyle(.primary)
```

Аналогично `font` модификатору, стиль кнопки распространяется на все дочерние элементы контейнеров, но преимущество имеет самый ближний к кнопке модификатор стиля.

#### TextField

`TextField+Styles` содержит все стили текстовых полей с макета.
Стиль текстового поля включает шрифт, характер фона и динамические цвета.
Обрабатываются **normal**, **error** и **disabled** состояния.

Стиль к кастомнму полю с плавающей подсказкой и отображением ошибки применяется через `.environment` модификатор.

Например
```swift
FloatingHintTextField(text: "",
                      hint: "Phone number",
                      secondHint: "+7 (",
                      validator: TextValidators { $0.nonEmpty() },
                      formatter: TextFormatters { $0.phoneMask(mask: "+7 (###) ###-##-##") },
                                                        keyboardType: .phonePad)
                .padding()
                .floatingTextFieldStyle(.rounded)
```

За стейт **error** отвечает валидатор. 
Валидаторы и форматтеры можно комбинировать. 
```swift
    // валидаторы
    TextValidators {
        $0.nonEmpty()
        $0.maxLength(10)
    }
    // форматтеры
    TextFormatters {
        $0.capitalized()
        $0.regex("...")
    }
```
Тогда валидация пройдет по принципу **FIFO**. То есть если первый валидатор не пройдет, то второй не будет проверен.
Форматирование пройдет также в порядке **FIFO**, но без прерывания. То есть если первый форматтер не изменит текст, то второй попробует.

Форматирование реализовано посредтвом двойного стейта `text` + `formattedText`. Так как нативного способа форматирования текста в SwiftUI нет (не работает как нам надо).
Форматтеры также как и валидаторы можно комбинировать.

#### OTPField

`OTPField` - это кастомное поле для ввода одноразового пароля.
Поле включает в себя **n** цифр, которые можно вводить только по одной.

`OTPField+Styles` содержит все стили поля для ввода одноразового пароля с макета. Стиль поля включает шрифт, характер фона и динамические цвета. Обрабатываются **normal**, **error** и **disabled** состояния.

Как правило валидация одноразового пароля проводится асинхронно через запрос к севреру, поэтому в конструкторе предусмотрены 2 binding для получения введенного пароля и для прокидывания ошибки внутрь поля.  

Пример использования,
```swift
OTPField(password: $password, hasError: $passwordHasError, codeLength: 6)
    .onChange(of: password, perform: { value in
        // вместо проверки вы можете использовать async обращение к серверу
        // или прокинуть непустое значение до вашего сервиса
        passwordHasError = !value.isEmpty && value != "00000"
    })
    .otpFieldStyle(.rounded)
```

#### TabBar

`TabBar+Styles` содержит все стили таббара с макета и экспериментальные стили в том числе.

Применяется к `TabBarView` а не к вьюшке внутри `TabView`.

Пример
```swift
    enum AppTab: Int, CaseIterable, LabelRepresentable {
        case main
        case profile

        // MARK: - Appearance

        var title: String {
            //..
        }

        var image: ImageAsset {
            //..
        }
    }

    // Внутри View

    @State private var selectedTab: AppTab = .main

    // MARK: - View

    var body: some View {
        ZStack(alignment: .bottom) {
            // Системный TabView для холда экранов
            TabView(selection: $selectedTab) {
                MainViewGroup()
                    .tag(AppTab.main)
                ProfileViewGroup()
                    .tag(AppTab.profile)
            }
            // Кастомный TabBar
            TabBarView(items: AppTab.allCases, selectedItem: $selectedTab)
                .tabBarViewStyle(.classic)
                // не используем automatic чтобы не запутать VoiceOver лишними элементами
                // однако в качестве сайдэффекта получаем жест перелистывания табов
                .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
```


Механизм скрытия/показа этого кастомного TabBar при вызове `.toolbar(.hidden, for: .tabBar)` работать не будет.
Вместо этого надо использовать `TabBarVisibilityManager.setTabBar(isVisible:)` через `WeakReference`.

Например,
```swift
    @StateObject private var tabBarHolder: TabBarVisibilityHolder = .init(isVisible: true)

    //..

    var body: some View {
        ZStack(alignment: .bottom) {
            // ..
            // тут описываем нужную анимацию
            if tabBarHolder.isVisible {
                TabBarView(items: AppTab.allCases, selectedItem: $selectedTab)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: tabBarHolder.isVisible)
            }
        }
        // прокидываем TabBarVisibilityManager в окружение
        .weakReference(tabBarHolder, as: TabBarVisibilityManager.self)
        // ..
    }
```

и где-то внутри табов
```swift
    @State private var tabBarIsVisible: Bool = true

     @WeakReference private var tabBarVisibilityManager: TabBarVisibilityManager?

    //..

    public var body: some View {
        //..
                Toggle(isOn: $tabBarIsVisible, label: {
                    Text(tabBarIsVisible ? "tabBar есть" : "tabBar нет")
                }).frame(maxWidth: 200)
                .onChange(of: tabBarIsVisible, perform: { newValue in
                    tabBarVisibilityManager?.setTabBar(isVisible: newValue)
                })
        //..
```

Более жизненный пример будет, если вы будете управлять `tabBarVisibilityManager` при смене destination в стеке `NavigationState`


## LibraryTestSupport

Таргет создан для изоляции и фиксации внешних зависимостей типа iOS-snapshot-testing

### Snapshot testing

Используйте `BaseSnapshotTest` для создания snapshot-тестов.
Если у вас возникнут сложности с snapshot-тестами, можете посмотреть документацию к используемому нами фреймворку
- [Swift Snapshot Testing](https://github.com/pointfreeco/swift-snapshot-testing) основной фреймворк
- [SwiftUI Preview Snapshots](https://github.com/doordash-oss/swiftui-preview-snapshots) конфигуратор preview


#### Подготовка View к тестированию

- Создайте экземпляр View
- Заполните preview, используя `previewProvider` и `PreviewSnapshots`

```swift
struct YourView_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case first
        case second
    }

    static var previews: some View {
        /// можно объединить в VStack, если на preview хочется видеть все сразу и менять фокус
        /// без VStack каждая preview будет отдельной вкладкой
        VStack {
            snapshots.previews
        }
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            /// вместо enum Preset можно использовать модель View, структуру или даже просто строку
            switch preset {
            case .first:
                YourView(model: YourModel(value: "First"))
            case .second:
                YourView(model: YourModel(value: "Second"))
            }
        })
    }
}
```

- Напишите тест

```swift
import PreviewSnapshotsTesting
import LibraryTestSupport
@testable import Library

final class YourViewSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllPresets() {
        YourView_Previews.snapshots.assertSnapshots(as: snapshoting(), 
                                                    record: isRecording)
    }

}
```

- Warning: Все тесты настроены на один девайс в `BaseSnapshotTest`. Допускается регулировка точности, но рекомендуется обходиться без неё.


#### Экспорт(запись) референсов

- Задать в настройках схемы launch argument `DEV_SNAPSHOT_REC`

@Image(source: SnapshotrecordingMode.png, alt: "Launch Snapshot Tests scheme"):

- Прогнать тесты. 
- Референсы должны переписаться.

- Warning: Не забудьте отключить галочку у launch argument после записи референсов.

Рекомендуется прогонять в режиме записи только целевые тесты, а не весь пак модуля.

Референсы сохраняются в формате PNG, для того чтобы их легко можно было просмотривать при ревью пулл-реквестов. 

- Note: Github не показывает превью для файлов более экономичного по занимаемому месту формата HEIC. К тому же, начиная с **Xcode 15.4** появились краши в библиотеке SnapshotTesting при сравнении изображений в формате HEIC. Поэтому мы перешли на PNG.

#### Импорт референсов

Для сравнения с референсами с макета вы можете вручную подготовить их.
Для этого надо
- Попросить дизайнера подготовить реф экрана под размер девайса из `BaseSnapshotTest`
- Положить этот референс в папку `__Snapshots__/NameOfTestCase/nameOfTest.png` рядом с тестом

Если вы не ошиблись в имени, то тесты будут сравниваться с вашими референсами.

### Launch testing

Используйте `BaseLaunchTest` для создания launch-теста.
При необходимости вы можете выставить launchArguments и launchEnvironment приложения в setup блоке или в теле теста.
Вызовите `assertLaunch` для performance теста, который измерит время запуска. 
При успешном результате сохраните baseline метрики для последующего сравнения.

### Accessibility testing

Используйте `BaseAccessibilityTest` для создания accessibility-теста.
По плану теста надо накликать до нужного экрана или использовать deeplinks и вызвать `assertAccessibility`.
Аудит зеркалит системную функцию проверки доступности. Можно как отфильтровать ненужные типы аудита, так и обработать ожидаемые ошибки аудита.
