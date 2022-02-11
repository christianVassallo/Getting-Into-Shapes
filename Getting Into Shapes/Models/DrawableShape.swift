//
//  DrawableShape.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct DrawableShape {
    
    enum ShapeType: Int, CaseIterable {
        case circle, rect, elipse, capsule, triangle
        
        static func random() -> Self {
            
            let rawValue = Int.random(in: 0..<ShapeType.allCases.count)
            return ShapeType(rawValue: rawValue) ?? .circle
        }
    }
    
    let id = UUID().uuidString
    let color: Color
    let size: CGSize
    let shapeType: ShapeType
}

extension DrawableShape {
    
    static func random() -> DrawableShape {
        
        let randColor = Color(
            red:   .random(in: 0...1),
            green: .random(in: 0...1),
            blue:  .random(in: 0...1)
        )
        
        let randSize = CGSize(width: .random(in: 50...150), height: .random(in: 50...150))
        
        let randType = ShapeType.random()
        
        return DrawableShape(color: randColor, size: randSize, shapeType: randType)
    }
}
