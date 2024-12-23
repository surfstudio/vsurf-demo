//
//  DetailViewOutput.swift
//  VSURFFlow
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Foundation

@objc
protocol DetailViewOutput: AnyObject {
    func addItem()
    func removeItem()
}
