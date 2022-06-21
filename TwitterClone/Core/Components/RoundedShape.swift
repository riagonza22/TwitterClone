//
//  RoundedShape.swift
//  TwitterSwiftClonePractice
//
//  Created by Ricardo Gonzalez on 6/15/22.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath( roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 90))
        
        return Path(path.cgPath)
    }
}
