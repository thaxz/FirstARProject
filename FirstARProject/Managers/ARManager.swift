//
//  ARManager.swift
//  FirstARProject
//
//  Created by thaxz on 01/10/23.
//

import Combine

class ARManager {
   
    // SINGLETON
    static let shared = ARManager()
    private init () {}
    
    // Passing a value so someone else can subscribe into it and use its value
    // The first value is what we want to pass throught and the second is any error than can be thrown
    // Ours is never because we're telling that this action can never fails
    var actionsStream = PassthroughSubject<ARAction, Never>()
    
}


