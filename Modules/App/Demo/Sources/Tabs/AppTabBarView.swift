//
//  AppTabBarView.swift
//  Catalog
//
//  Created by Nikita Korobeinikov on 25.10.2024.
//

import SwiftUI
import MVCFlow
import MVPFlow
import MVVMFlow
import VIPERFlow
import VSURFFlow
import Library

struct AppTabBarView: View {

    // MARK: - States

    @StateObject private var tabBarHolder: TabBarVisibilityHolder = .init(isVisible: true)

    @State private var selectedTab: AppTab = .mvc

    // MARK: - View

    var body: some View {
        TabView(selection: $selectedTab) {
            MVCViewGroup()
                .tag(AppTab.mvc)
            MVPViewGroup()
                .tag(AppTab.mvp)
            MVVMViewGroup()
                .tag(AppTab.mvvm)
            VIPERViewGroup()
                .tag(AppTab.viper)
            VSURFViewGroup()
                .tag(AppTab.vsurf)
        }.overlay(alignment: .bottom) {
            TabBarView(items: AppTab.allCases, selectedItem: $selectedTab)
                .opacity(tabBarHolder.isVisible ? 1 : 0)
                .animation(.easeInOut, value: tabBarHolder.isVisible)
        }
        .weakReference(tabBarHolder, as: TabBarVisibilityManager.self)
        .tabBarViewStyle(.rounded)
        // не используем automatic чтобы не запутать VoiceOver лишними элементами
        // однако в качестве сайдэффекта получаем жест перелистывания табов
        // UPD: вернули automatic потому что со стилем page табы странно себя вели
        .tabViewStyle(.automatic)
    }

}
