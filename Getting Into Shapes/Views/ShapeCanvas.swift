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
        
        GeometryReader { geometry in
            
            ForEach(0..<viewModel.shapes.count) { index in
                viewModel.createDragableShape(
                    for: index,
                    in: CGRect(x: geometry.frame(in: .global).minX, y: geometry.frame(in: .global).minY, width: geometry.size.width, height: geometry.size.height)
                )
            }
            
//            DragableShape(
//                baseShape: AnyShape(base: Circle()),
//                initialPostion: CGPoint(x: (geometry.size.width * 0.30) - 50, y: (geometry.size.height * 0.25) - 50),
//                color: .green
//            )
//            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//
//            DragableShape(
//                baseShape: AnyShape(base: Rectangle()),
//                initialPostion: CGPoint(x: (geometry.size.width * 0.8) - 50, y: (geometry.size.height * 0.5) - 50),
//                color: .red
//            )
//            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//
//            DragableShape(
//                baseShape: AnyShape(base: Capsule()),
//                initialPostion: CGPoint(x: (geometry.size.width * 0.5) - 60, y: (geometry.size.height * 0.75) - 40),
//                color: .blue
//            )
//            .frame(width: 120, height: 80)
//
//            DragableShape(
//                baseShape: AnyShape(base: Ellipse()),
//                initialPostion: CGPoint(x: (geometry.size.width * 0.75) - 40, y: (geometry.size.height * 0.30) - 120),
//                color: .orange
//            )
//            .frame(width: 80, height: 120)
        }
        
    }
}
