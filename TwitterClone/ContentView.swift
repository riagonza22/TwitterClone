//
//  ContentView.swift
//  TwitterClone
//
//  Created by Ricardo Gonzalez on 6/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            // no user logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // have logged in user
                mainInterfaceView
            }
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
//    @StateObject var viewModel = AuthViewModel()
    
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}


extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0: -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .onAppear() {
            showMenu = false
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
    }
}
