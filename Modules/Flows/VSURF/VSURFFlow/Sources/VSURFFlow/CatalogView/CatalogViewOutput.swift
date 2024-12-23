//
//  CatalogViewOutput.swift
//  VSURFFlow
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Foundation

@objc
protocol CatalogViewOutput: AnyObject {
    func addItem(_ item: String)
    func removeItem(_ item: String)
}
