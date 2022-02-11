//
//  ShapesView.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct ShapesView: View {
    
    var body: some View {
        
        GeometryReader { geometry in
            
            DragableShape(
                baseShape: Circle(),
                initialPostion: CGPoint(x: (geometry.size.width * 0.30) - 50, y: (geometry.size.height * 0.25) - 50),
                color: .green
            )
            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            DragableShape(
                baseShape: Rectangle(),
                initialPostion: CGPoint(x: (geometry.size.width * 0.8) - 50, y: (geometry.size.height * 0.5) - 50),
                color: .red
            )
            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            DragableShape(
                baseShape: Capsule(),
                initialPostion: CGPoint(x: (geometry.size.width * 0.5) - 60, y: (geometry.size.height * 0.75) - 40),
                color: .blue
            )
            .frame(width: 120, height: 80)
            
        }
        
    }
}
