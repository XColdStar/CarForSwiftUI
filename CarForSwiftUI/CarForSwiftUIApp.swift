//
//  CarForSwiftUIApp.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/21.
//

import SwiftUI

@main
struct CarForSwiftUIApp: App {
    
//    init() {
//        UITabBar.appearance().unselectedItemTintColor = UIColor.black
//    }

    @State private var selectedIndex = 0
    
    var body: some Scene {
        WindowGroup {
            TabView(selection:$selectedIndex) {
                TCHomePage().environmentObject(TCLookedManager())
                    .tabItem {
                        Image(systemName: selectedIndex == 0 ? "car.2" : "car")
                        Text("二手车")
                    }.tag(0)
                    
                ContentView()
                    .tabItem {
                        Image(systemName: selectedIndex == 1 ? "star.fill" : "star")
                        Text("测试")
                    }.tag(1)
            }
            .accentColor(.yellow)
        }
    }
}
