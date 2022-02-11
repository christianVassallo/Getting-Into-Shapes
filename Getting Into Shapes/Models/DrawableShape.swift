//
//  DrawableShape.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct DrawableShape {
    
    enum ShapeType {
        case circle, rect, elipse, capsule
    }
    
    let color: Color
    let size: CGSize
    let shapeType: ShapeType
}
