//
//  SwifUIDemoApp.swift
//  SwifUIDemo
//
//  Created by Rahul Sharma on 01/05/22.
//

import SwiftUI

@main
struct SwifUIDemoApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
