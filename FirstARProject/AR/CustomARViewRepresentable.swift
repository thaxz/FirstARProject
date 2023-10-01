//
//  CustomARViewRepresentable.swift
//  FirstARProject
//
//  Created by thaxz on 01/10/23.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {
        
    }
    
}
