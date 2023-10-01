//
//  ARAction.swift
//  FirstARProject
//
//  Created by thaxz on 01/10/23.
//

import SwiftUI

// Enum with all the options that we're going to have on our ar scene
// Everything that we'll be able to do on our scene will have a case in this enum
enum ARAction {
    
    case placeBlock(color: Color)
    case removeAllAnchors
    case placeBall
}
