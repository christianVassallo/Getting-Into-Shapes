//
//  DrawableShape.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct DrawableShape {
    
    // Enum containing all the supported shape types
    enum ShapeType: Int, CaseIterable {
        case circle, rect, elipse, capsule, triangle, hexagon, trapezoid, pacMan
        
        // convenience func to return a random case
        static func random() -> Self {
            let rawValue = Int.random(in: 0..<ShapeType.allCases.count)
            return ShapeType(rawValue: rawValue) ?? .circle
        }
    }
    
    let id = UUID().uuidString
    var color: Color
    let size: CGSize
    let shapeType: ShapeType
}

extension DrawableShape {
    
    // convenience func to generate a new instance of DrawableShape with random data
    static func random() -> DrawableShape {
        
        let randColor = Color.random()
        
        let randSize = CGSize(width: .random(in: 50...150), height: .random(in: 50...150))
        
        let randType = ShapeType.random()
        
        return DrawableShape(color: randColor, size: randSize, shapeType: randType)
    }
    
    // convenience computed variable to return a Shape View of an appropriate type
    public var baseView: AnyShape {
        switch self.shapeType {
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
        case .trapezoid:
            return AnyShape(base: Trapezoid())
        case .pacMan:
            return AnyShape(base: PacmanShape())
        }
    }
}

extension Color {
    static func random() -> Color {
        return Color(
            red:   .random(in: 0...1),
            green: .random(in: 0...1),
            blue:  .random(in: 0...1)
        )
    }
}
