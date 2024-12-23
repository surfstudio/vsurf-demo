//
//  VSURFStateFacade.swift
//  VSURFState
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

/// Фасад модуля `VSURFState` для доступа к сервисам и хранилищам
public enum VSURFStateFacade {

    public enum Units {

        public static func catalog() -> CatalogUnitOutput {
            return CatalogUnitFactory.produce()
        }

        public static func cart() -> CartUnitInput & CartUnitOutput {
            return CartUnitFactory.produce()
        }

    }

}
