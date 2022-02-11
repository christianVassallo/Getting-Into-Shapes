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
    
    // given a rect returns a random postion for given shape, accounting for the shapes size
    public func randomPosition(for shape: DrawableShape, in rect: CGRect) -> CGPoint {
        
        let safeMaxX = max(0, rect.width - shape.size.width)
        let safeMaxY = max(0, rect.height - shape.size.height)
        
        return CGPoint(
            x: CGFloat.random(in: 0...safeMaxX),
            y: CGFloat.random(in: 0...safeMaxY)
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
