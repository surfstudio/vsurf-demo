public enum NetworkModuleFacade {

    /// Сервисы реализующие методы сетего слоя
    public enum Services {
        /// Сервис авторизации
        public static func auth() -> AuthService {
            DefaultAuthService(builder: ChainBuilderFactory.create())
        }
    }
}
