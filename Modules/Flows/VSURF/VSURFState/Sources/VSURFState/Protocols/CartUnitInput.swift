//
//  CartUnitInput.swift
//  VSURFState
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Cart

public protocol CartUnitInput: AnyObject {
    func addItem(_ item: Item)
    func removeItem(_ item: Item)
    func removeAll()
}
