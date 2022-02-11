//
//  Trapezoid.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct Trapezoid: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let insetAmount = rect.maxX * 0.25
        
        path.move(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        
        return path
    }
}
