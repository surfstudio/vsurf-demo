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
}
