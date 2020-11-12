//
//  CustomCorner.swift
//  CovidApp
//
//  Created by Irfandio Daffa on 17/10/20.
//

import SwiftUI

struct CustomCorner: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 100))
        
        return Path(path.cgPath)
    }
}
