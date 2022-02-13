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
                        viewModel.createInteractableShape(
                            for: index,
                            in: CGRect(x: geometry.frame(in: .global).minX, y: geometry.frame(in: .global).minY, width: geometry.size.width, height: geometry.size.height),
                            onTap: {
                                viewModel.selectShape(at: index)
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
                    Group {
                        Button("Create") {
                            viewModel.createRandomShape()
                        }
            
                        Spacer()

                        Menu {
                            Button(action: {
                                viewModel.deleteSelectedShape()
                            }) {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        } label: {
                            Text("Edit Shape")
                        }
                        .disabled(!viewModel.editMenuIsEnable)
                    }
                    .padding()
                }
            }
        }
    }
}
