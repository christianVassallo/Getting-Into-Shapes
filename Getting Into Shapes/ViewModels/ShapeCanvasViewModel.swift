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
    
    public func dragableShape(for index: Int, position: CGPoint) -> some View {

        let shape = shapes[index]

        let baseShape = shapeView(for: shape.shapeType)
        
        return DragableShape(baseShape: baseShape, initialPostion: position, color: shape.color)
            .frame(width: shape.size.width, height: shape.size.height)
    }
    
    public func randomPosition(in rect: CGRect) -> CGPoint {
        return CGPoint(x: CGFloat.random(in: 0...rect.width), y: CGFloat.random(in: 0...rect.height))
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
