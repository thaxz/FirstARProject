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
    
    // Required inits
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
    }
    
    // Configuration
    
    func configurationExamples(){
        // Tracks the device relative to it's environment
        // Needed to place content that is relative to your phone
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
    }
    
    
}
