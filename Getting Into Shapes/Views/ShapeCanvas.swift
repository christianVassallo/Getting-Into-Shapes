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
                viewModel.dragableShape(
                    for: index,
                    position: viewModel.randomPosition(
                        in: CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height)
                    )
                )
            }
        }
        
    }
}
