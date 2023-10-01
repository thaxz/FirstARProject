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
    
    // This is the init that is being used
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
        placeBlueBlock()
    }
    
    // Mock object placed in the scene
    func placeBlueBlock(){
        // Creating entity
        let block = MeshResource.generateBox(size: 1)
        let material = SimpleMaterial(color: .blue, isMetallic: false)
        let entity = ModelEntity(mesh: block, materials: [material])
        // Connecting with anchor
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        // Adding to the scene
        scene.addAnchor(anchor)
    }
    
    // MARK: Configuration examples
    
    // Scene Configuration
    func configurationExamples(){
        // Tracks the device relative to it's environment
        // Needed to place content that is relative to your phone
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
    }
    
    // Anchor configuration
    func anchorExamples(){
        // Attach anchors at specific coordinates in the iPhone-centered coordinate system
        // Exactly the same as the iPhone was when the app was opened
        let coordinateAnchor = AnchorEntity(world: .zero)
        // Add an anchor to the scene
        scene.addAnchor(coordinateAnchor)
    }
    
    // Entity configuration
    func entityExamples(){
        // Generating an entity programmaticaly
        let box = MeshResource.generateBox(size: 1)
        let entity = ModelEntity(mesh: box)
        
        // Add entity to an anchor so it's placed in the scene
        let anchor = AnchorEntity()
        anchor.addChild(entity)
    }
}
