//
//  CatalogUnitOutput.swift
//  VSURFState
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Cart
import Combine

public protocol CatalogUnitOutput: AnyObject {
    var items: AnyPublisher<[Item], Never> { get }
}
