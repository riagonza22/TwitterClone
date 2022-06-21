//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Ricardo Gonzalez on 6/21/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Set up account",
                           title2: "Add a profile photo.")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                        
                }
                
            }
            .padding(.top, 44)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    func loadImage() {
        
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}


