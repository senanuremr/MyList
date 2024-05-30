//
//  My_ListApp.swift
//  My List
//
//  Created by Senanur EMİR on 27.04.2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
 struct ListApp: App {
     @StateObject var viewModel = AuthViewModel()
     @StateObject var listsViewModel = ListsViewModel() 

     init(){
         FirebaseApp.configure()
     }
     
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(ListsViewModel())
            
               
        }
    }
}

