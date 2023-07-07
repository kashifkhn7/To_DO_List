//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by MUHAMMAD KASHIF on 02/11/2022.
//

import SwiftUI
/*
 MVVM Architecture
 Model - Data
 View - UI
 ViewModel - Manages Models for view
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
