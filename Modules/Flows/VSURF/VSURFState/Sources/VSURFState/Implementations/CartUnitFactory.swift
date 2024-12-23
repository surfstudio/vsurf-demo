//
//  CartUnitFactory.swift
//  VSURFState
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

enum CartUnitFactory {

    public static func produce() -> CartUnitInput & CartUnitOutput {
        return CartUnit(model: .init())
    }

}
