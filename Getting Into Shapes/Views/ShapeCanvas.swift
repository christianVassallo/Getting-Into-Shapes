//
//  ShapeCanvas.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct ShapeCanvas: View {
    
    let viewModel = ShapeCanvasViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ForEach(0..<viewModel.shapes.count) { index in
                // TODO: don't use same position for all shapes
                viewModel.dragableShape(for: index, position: CGPoint(x: (geometry.size.width * 0.30) - 50, y: (geometry.size.height * 0.25) - 50))
            }
        }
        
    }
}
