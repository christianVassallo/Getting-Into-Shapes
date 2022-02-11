//
//  ShapeCanvasViewModel.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct ShapeCanvasViewModel {
    
    public var shapes: [DrawableShape] = [
        DrawableShape(color: .green, size: CGSize(width: 100, height: 100), shapeType: .circle),
        DrawableShape(color: .red, size: CGSize(width: 100, height: 100), shapeType: .rect),
        DrawableShape(color: .blue, size: CGSize(width: 120, height: 80), shapeType: .capsule),
        DrawableShape(color: .orange, size: CGSize(width: 80, height: 120), shapeType: .elipse)
    ]
    
    // creates a shap view given an index and a rect for it to be positioned in
    public func createDragableShape(for index: Int, in rect: CGRect) -> some View {

        let shape = shapes[index]

        let baseShape = shapeView(for: shape.shapeType)
        
        let randPosition = randomPosition(for: shape, in: rect)
        
        return DragableShape(baseShape: baseShape, initialPostion: randPosition, color: shape.color)
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
        }
    }
}
