//
//  ContentView.swift
//  Example
//
//  Created by Nikita Korobeinikov on 19.04.2024.
//

import SwiftUI
import Resources
import Library
import SurfCore

struct ContentView: View {

    // MARK: - Private Properties

    @StateObject private var colorThemeHolder: ColorThemeHolder = .init()

    // MARK: - View

    var body: some View {
        EmptyView()
        .font(.paragraph1)
        .foregroundStyle(Asset.Colors.Text.primary.color)
        .tint(Asset.Colors.Buttons.Primary.normalBackground.color)
        .weakReference(colorThemeHolder, as: ColorThemeManager.self)
    }
}

#Preview {
    ContentView()
}
