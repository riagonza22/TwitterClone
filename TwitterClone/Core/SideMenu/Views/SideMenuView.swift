//
//  SideMenuView.swift
//  TwitterSwiftClonePractice
//
//  Created by Ricardo Gonzalez on 6/15/22.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                    
                    Text("@batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView().padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { sideViewModel in
                if sideViewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: sideViewModel)
                    }
                
                } else if sideViewModel == .logout {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SideMenuOptionRowView(viewModel: sideViewModel)
                    }
                } else {
                    SideMenuOptionRowView(viewModel: sideViewModel)
                }
            }
            
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
