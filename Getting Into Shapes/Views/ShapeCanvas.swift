//
//  ShapeCanvas.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct ShapeCanvas: View {
    
    @ObservedObject private var viewModel = ShapeCanvasViewModel()
    
    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                
                // ensure has size before rendering shapes
                if (geometry.size != .zero) {
                    ForEach(0..<viewModel.shapes.count, id: \.self) { index in
                        viewModel.createDragableShape(
                            for: index,
                            in: CGRect(x: geometry.frame(in: .global).minX, y: geometry.frame(in: .global).minY, width: geometry.size.width, height: geometry.size.height)
                        )
                    }
                }
            }
            
            Button(
                "Create Random Shape",
                action: {
                    viewModel.createRandomShape()
                }
            )
            .padding(.bottom)
        }
    }
}
