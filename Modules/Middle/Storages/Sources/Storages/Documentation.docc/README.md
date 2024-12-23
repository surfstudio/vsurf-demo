# Storages

@Metadata {
    @PageKind(article)
    @Available(iOS, introduced: "16.0")
}

Модуль отвечающий за хранение данных.

## Временное хранилище

 `TemporaryValueStore` - хранилище данных, которые будут удалены после завершения работы программы.
 Можно использовать для передачи между несколькими экранами и независимой очистки.
 
 Условный пример
 ```swift
    // Главный экран
    /// Создаем хранилище для корзины
    let cartStore = TemporaryValueStore<[Product]>(value: [])

    // Экран каталог
    cartStore.addProduct(someProduct)

    // Экран корзины
    let cart = cartStore.load()

 ```

 Для накопительных изменений не нужно явно загружать и сохранять данные.
 Лучше создать extension типа
 
 ```swift
 public extension ValueStore where Value == [Product] {

    func addProduct(_ product: Product) {
        if let value = load() {
            save(value: value.appending(product))
        } else {
            save(value: product)
        }
    }

}
 ```
и использовать его в модулях верхнего уровня, тем самым спрятав лишние ветвления "под капот".

Накопительные операции доступные "из коробки"
- `append` для String
- `+=` для Int
- `-=` для Int
- `*=` для Int

Они также могут применяться и к постоянному хранилищу.

## Постоянное хранилище
`PersistentValueStore` - хранилище данных, которые будут сохранены после завершения работы программы.

### Хранилища

Реализовано несколько вариантов постоянного хранилища
- `FileDataStore` для хранения данных в файле
- `KeychainDataStore` для хранения данных в Keychain
- `UserDefaultsDataStore` для хранения данных в UserDefaults

### Кодирование/декодирование

Для кодирования и декодирования используется `Codable` протокол.
Реализовано несколько оберток для стандартных декодеров
- `JSONDataConverter` - для JSON (.json)
- `PlistDataConverter` - для PropertyList (.plist)

В `DataConverterFactory` можно настроить системные декодеры, которые находятся внутри реализаций `DataConverter`.

## Очистка

На каждый объект создается свое хранилище.
Поэтому можно провести независимую очистку данных по запросу.

`ValueStore` и `DataStore` соответстсуют протоколу `DataCleanerCompatible`, что позволяет анонимно их очищать.

Добавить храниище в пул очистки можно
```swift
DataCleanerServiceInjector.inject(storage: tokenStore, events: [AuthEvent.logout])
```
События могут быть любыми (`AnyHashable`), но лучше использовать enum, чтобы не допустить ошибок.

При наступлении события, все хранилища, которые были добавлены с этим событием, будут очищены.

Рекомендуется настраивать очистку по событиям на уровне `App`. Так как этот модуль знает о всех событиях и хранилищах, которые с уровня `Feature` доступны в виде `DataCleanerCompatible`.
