//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Ricardo Gonzalez on 6/20/22.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                ContentView()
                ProfilePhotoSelectorView()
            }
            .environmentObject(viewModel)
        }
    }
}
