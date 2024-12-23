public enum NetworkModuleFacade {

    /// Сервисы реализующие методы сетего слоя
    public enum Services {
        /// Сервис авторизации
        public static func auth() -> AuthService {
            DefaultAuthService(builder: ChainBuilderFactory.create())
        }
    }

    /// Хранилища, созданные этим модулем
    public enum Storages {
        /// Хранилище токенов для добавления в DataCleaner
        public static var tokens: DataCleanerCompatible {
            TokensStorageFactory.produce()
        }
    }

    /// Входные параметры для настройки модуля
    public enum Inputs {

        /// Установка базового URL. Может быть
        /// - parameter url: Базовый URL используемый во всех запросах сетевого слоя.
        public static func setBaseUrl(_ url: String) {
            Urls.setup(baseUrl: url)
        }
    }
}
