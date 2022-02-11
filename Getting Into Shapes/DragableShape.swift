//
//  DragableShape.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct DragableShape<S: Shape>: View {
    
    let baseShape: S
    let initialPostion: CGPoint
    let color: Color
    
    @State var transalation: CGSize = CGSize(width: 0.0, height: 0.0)
    
    var shapePosition: CGPoint {
        return CGPoint(x: initialPostion.x + transalation.width, y: initialPostion.y + transalation.height)
    }
    
    var shapDragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                self.transalation = value.translation
            }
    }
    
    var body: some View {
        baseShape
            .fill(color)
            .position(x: shapePosition.x, y: shapePosition.y)
            .gesture(shapDragGesture)
    }
}
