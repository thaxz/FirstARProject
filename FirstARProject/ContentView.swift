//
//  ContentView.swift
//  FirstARProject
//
//  Created by thaxz on 01/10/23.
//

import SwiftUI

struct ContentView: View {
    
    // colors that the user can choose
    @State private var colors: [Color] = [.green, .red, .blue]
    
    var body: some View {
        CustomARViewRepresentable()
            .ignoresSafeArea()
            .overlay(alignment: .bottom){
                ScrollView(.horizontal){
                    HStack{
                        Button {
                            // Passing remove action by combine
                            ARManager.shared.actionsStream.send(.placeBall)
                        } label: {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                        }
                        
                        Button {
                            // Passing remove action by combine
                            ARManager.shared.actionsStream.send(.removeAllAnchors)
                        } label: {
                            Image(systemName: "arrowtriangle.up.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                        }
                        Button {
                            // Passing remove action by combine
                            ARManager.shared.actionsStream.send(.removeAllAnchors)
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                        }
                        ForEach(colors, id: \.self){ color in
                            Button {
                                // Passing place block action by combine
                                ARManager.shared.actionsStream.send(.placeBlock(color: color))
                            } label: {
                                color
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(.regularMaterial)
                                    .cornerRadius(16)
                            }
                        }
                    }
                    .padding()
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
