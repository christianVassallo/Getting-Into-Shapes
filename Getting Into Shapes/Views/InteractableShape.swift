//
//  InteractableShape.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

// InteractableShape handles the logic to:
// - drag a shape view around the screen
// - rotate a shape view in place
// - scale a shape view in place
struct InteractableShape: View {
    
    let baseShape: AnyShape
    let initialPostion: CGPoint
    let color: Color
    
    // MARK: - position/ drag gesture
    
    // the postion of the shape at the end of the previous dragGesture
    @State var updatedPostion: CGPoint?
    
    // the translation from a currently occuring dragGesture
    @State var currentTranslation: CGSize = CGSize(width: 0.0, height: 0.0)
    
    var shapeDragGesture: some Gesture {
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
    
    // MARK: - scale/ rotation gesture
    
    @State var storedAngle: Double = 0.0
    @State var angleAdjustment: Double = 0.0
    
    // the shapes current angle at any point is the previously `storedAngle`
    //    + the `angleAdjustment` (from an active rotationGesture)
    var currentAngle: Double {
        return storedAngle + angleAdjustment
    }
    
    @State var storedScale: CGFloat = 1.0
    @State var scaleAdjustment: CGFloat = 1.0
    
    // the shapes current scale at any point is the previously `storedScale`
    //    + the diff value of the `angleAdjustment` (from an active magnificationGesture) snd 1.0 (normal scale)
    var currentScale: CGFloat {
        let diff = (scaleAdjustment - 1)
        return storedScale + diff
    }
    
    var scaleAndRotateGesture: some Gesture {
        let rotationGesture = RotationGesture()
            .onChanged { angle in
                self.angleAdjustment = angle.degrees
            }
            .onEnded { _ in
                storedAngle = currentAngle
                angleAdjustment = 0.0
            }
            
        
        let magnificationGesture = MagnificationGesture()
            .onChanged { value in
                print(value)
                print(value.magnitude)
                self.scaleAdjustment = value.magnitude
            }
            .onEnded { _ in
                storedScale = currentScale
                scaleAdjustment = 1.0
            }

        return magnificationGesture.simultaneously(with: rotationGesture)
    }
    
    var body: some View {
        baseShape
            .fill(color)
            .rotationEffect(Angle.degrees(currentAngle))
            .scaleEffect(currentScale)
            .position(x: currentPosition.x, y: currentPosition.y)
            .gesture(shapeDragGesture)
            .gesture(scaleAndRotateGesture)
    }
}
