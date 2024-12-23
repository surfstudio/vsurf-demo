//
//  AppTab.swift
//  Catalog
//
//  Created by Nikita Korobeinikov on 25.10.2024.
//

import Library
import Resources

public enum AppTab: Int, CaseIterable, LabelRepresentable {
    case mvc
    case mvp
    case mvvm
    case viper
    case vsurf

    // MARK: - Appearance

    public var title: String {
        switch self {
        case .mvc:
            return "MVC"
        case .mvp:
            return "MVP"
        case .mvvm:
            return "MVVM"
        case .viper:
            return "VIPER"
        case .vsurf:
            return "VSURF"
        }
    }

    public var image: ImageAsset {
        return Asset.Images.TabBar.main
    }
}
