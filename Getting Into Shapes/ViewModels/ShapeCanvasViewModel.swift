//
//  ShapeCanvasViewModel.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

class ShapeCanvasViewModel: ObservableObject {
    
    @Published public var shapes: [DrawableShape] = [
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random()
    ]
    
    // dict of shape id to position
    var shapePositions: [String: CGPoint] = [:]
    
    // creates a shap view given an index and a rect for it to be positioned in
    public func createDragableShape(for index: Int, in rect: CGRect) -> some View {

        let shape = shapes[index]

        let baseShape = shapeView(for: shape.shapeType)
        
        // retrieve stored shape position or generate a new position
        let position = shapePositions[shape.id] ?? randomPosition(for: shape, in: rect)
        
        // store shapes position for next render
        if shapePositions[shape.id] == nil {
            shapePositions[shape.id] = position
        }
        
        return DragableShape(baseShape: baseShape, initialPostion: position, color: shape.color)
            .frame(width: shape.size.width, height: shape.size.height)
    }
    
    // returns a random postion for a given `shape` and `rect`, ensuring the shape will be fully visable on the screen
    public func randomPosition(for shape: DrawableShape, in rect: CGRect) -> CGPoint {
        
        // a max center position that allows the shape to be fully visable on screen
        let maxX = rect.width - (shape.size.width / 2)
        let maxY = rect.height - (shape.size.height / 2)
        
        // a min center position that allows the shape to be fully visable on screen
        let minX = rect.minX + (shape.size.width / 2)
        let minY = rect.minY + (shape.size.height / 2)
        
        // use `max` to ensure upperbound is never less than lowerbound
        return CGPoint(
            x: CGFloat.random(in: minX...max(minX, maxX)),
            y: CGFloat.random(in: minY...max(minY, maxY))
        )
    }
    
    public func createRandomShape() {
        shapes.append(DrawableShape.random())
    }
    
    private func shapeView(for type: DrawableShape.ShapeType) -> AnyShape {
        switch type {
        case .circle:
            return AnyShape(base: Circle())
        case .rect:
            return AnyShape(base: Rectangle())
        case .elipse:
            return AnyShape(base: Ellipse())
        case .capsule:
            return AnyShape(base: Capsule())
        case .triangle:
            return AnyShape(base: Triangle())
        case .hexagon:
            return AnyShape(base: Hexagon())
        }
    }
}
