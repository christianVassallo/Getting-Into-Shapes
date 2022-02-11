//
//  DragableShape.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

// DragableShape handles the logic to drag a Shape view around the screen
struct DragableShape: View {
    
    let baseShape: AnyShape
    let initialPostion: CGPoint
    let color: Color
    
    // MARK: - position/ drag gesture
    
    // the postion of the shape at the end of the previous dragGesture
    @State var updatedPostion: CGPoint?
    
    // the translation from a currently occuring dragGesture
    @State var currentTranslation: CGSize = CGSize(width: 0.0, height: 0.0)
    
    var shapDragGesture: some Gesture {
        DragGesture()
            // update the current translation
            .onChanged { value in
                self.currentTranslation = value.translation
            }
            // update the postion and reset the current translation
            .onEnded { _ in
                self.updatedPostion = currentPosition
                self.currentTranslation = .zero
            }
    }
    
    // the shapes current postion is calculated using the postion stored at end of previous drag and applying the current drag transalation
    var currentPosition: CGPoint {
        let position = updatedPostion ?? initialPostion
        return CGPoint(x: position.x + currentTranslation.width, y: position.y + currentTranslation.height)
    }
    
    // MARK: - angle/ rotation gesture
    
    // the shapes current rotation angle in degress
    @State var currentAngle: Angle = Angle.degrees(0.0)
    
    var shapRotateGesture: some Gesture {
        RotationGesture()
            .onChanged({ angle in
                self.currentAngle = Angle.degrees(angle.degrees)
            })
    }
    
    var body: some View {
        baseShape
            .fill(color)
            .rotationEffect(currentAngle)
            .position(x: currentPosition.x, y: currentPosition.y)
            .gesture(shapDragGesture)
            .gesture(shapRotateGesture)
    }
}
