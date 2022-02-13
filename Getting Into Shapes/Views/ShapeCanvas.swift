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
                    ForEach(viewModel.shapes, id: \.id) { shape in
                        viewModel.createInteractableShape(
                            for: shape,
                            in: CGRect(x: geometry.frame(in: .global).minX, y: geometry.frame(in: .global).minY, width: geometry.size.width, height: geometry.size.height),
                            onTap: {
                                viewModel.selectShape(shape)
                            }
                        )
                    }
                }
            }
            // contentShape required to add tapGesture to a container view
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.clearSelection()
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ShapeToolbar(
                        editMenuIsEnabled: viewModel.editMenuIsEnable,
                        createHandler: { viewModel.createRandomShape() },
                        deleteHandler: { viewModel.deleteSelectedShape() }
                    )
                        .padding()
                }
            }
        }
    }
}
