//
//  CustomARView.swift
//  FirstARProject
//
//  Created by thaxz on 01/10/23.
//

import ARKit
import RealityKit
import SwiftUI

class CustomARView: ARView {
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
    }
    
    
}
