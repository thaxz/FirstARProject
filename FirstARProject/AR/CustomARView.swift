//
//  CustomARView.swift
//  FirstARProject
//
//  Created by thaxz on 01/10/23.
//

import ARKit
import RealityKit
import SwiftUI
import Combine

class CustomARView: ARView {
    
    private var cancellables: Set<AnyCancellable> = []
    
    // Components
    var ball: Ball.Cena? = nil
    
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
        subscribeToActionStream()
    }
    
    // Subscribing to combine
    func subscribeToActionStream(){
        ARManager.shared.actionsStream
        // subscribing with sink
            .sink { [weak self] action in
                // switching according to each action
                switch action {
                case .placeBlock(let color):
                    self?.placeBlock(ofColor: color)
                case .removeAllAnchors:
                    self?.scene.anchors.removeAll()
                case .placeBall:
                    self?.placeBall()
                case .playBallAnimation:
                    self?.playBallAnimation()
                }
            }
        // using combine means that we'll need to keep a strong reference
            .store(in: &cancellables)
    }
    
    // Mock object placed in the scene
    func placeBlock(ofColor color: Color){
        // Creating entity
        let block = MeshResource.generateBox(size: 0.1)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: block, materials: [material])
        // Connecting with anchor
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        // Adding to the scene
        scene.addAnchor(anchor)
    }
    
    // Adding 3D object from reality composer to our scene
    func placeBall(){
        do {
            let ball = try Ball.loadCena()
            scene.addAnchor(ball)
            self.ball = ball
        } catch {
            print(error)
        }
    }
    
    // Adding animation to our 3D Object
    func playBallAnimation(){
        ball?.notifications.myBallTrick.post()
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
