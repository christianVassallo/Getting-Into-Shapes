//
//  PacmanShape.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 12/2/22.
//

import SwiftUI


struct PacmanShape: Shape {
    
    // Algorithm provided by good ol stack overflow
    func pointOnCircumference(center: CGPoint, radius: CGFloat, radiansAngle: CGFloat) -> CGPoint {
        let x = center.x + radius * cos(radiansAngle)
        let y = center.y + radius * sin(radiansAngle)
        
        return CGPoint(x: x, y: y)
    }
    
    func path(in rect: CGRect) -> Path {
        
        // Note: with arcs 0 degress is the position to the right
        let startAngle = Angle.degrees(45)
        let endAngle = Angle.degrees(360 - 45)
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = (rect.width / 2)
        
        var path = Path()
        
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.addLine(to: center)
        path.addLine(to: pointOnCircumference(center: center, radius: radius, radiansAngle: CGFloat(startAngle.radians)))
        path.closeSubpath()
        
        return path
    }
}
