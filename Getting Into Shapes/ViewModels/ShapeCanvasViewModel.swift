//
//  ShapeCanvasViewModel.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

class ShapeCanvasViewModel: ObservableObject {
    
    @Published public private(set) var shapes = [DrawableShape]()
    
    @Published public private(set) var selectedId: String?
    
    init(initialShapeCount: Int = 5) {
        for _ in (1...initialShapeCount) {
            createRandomShape()
        }
    }
    
    // dict of shape id to position
    var shapePositions: [String: CGPoint] = [:]
    
    // creates a shap view given a DrawableShape and a rect for it to be positioned in
    public func createInteractableShape(for shape: DrawableShape, in rect: CGRect, onTap: @escaping (() -> Void)) -> some View {

        // retrieve stored shape position or generate a new position
        let position = shapePositions[shape.id] ?? randomPosition(for: shape, in: rect)
        
        // store shapes position for next render
        if shapePositions[shape.id] == nil {
            shapePositions[shape.id] = position
        }
        
        return InteractableShape(
            baseShape: shape.baseView,
            initialPostion: position,
            color: shape.color,
            isSelected: shape.id == selectedId,
            onTap: onTap
        )
        .frame(width: shape.size.width, height: shape.size.height)
    }
    
    // returns a random postion for a given `shape` and `rect`, ensuring the shape will be fully visable on the screen
    public func randomPosition(for shape: DrawableShape, in rect: CGRect) -> CGPoint {
        
        // a max center position that allows the shape to be fully visable on screen
        let maxX = rect.width - (shape.size.width / 2)
        let maxY = rect.height - (shape.size.height / 2)
        
        // a min center position that allows the shape to be fully visable on screen
        let minX = rect.minX + (shape.size.width / 2)
        let minY = rect.minY + (shape.size.height / 2)
        
        // use `max` to ensure upperbound is never less than lowerbound
        return CGPoint(
            x: CGFloat.random(in: minX...max(minX, maxX)),
            y: CGFloat.random(in: minY...max(minY, maxY))
        )
    }
    
    public func createRandomShape() {
        shapes.append(DrawableShape.random())
    }
    
    public func selectShape(_ shape: DrawableShape) {
        selectedId = shape.id
    }
    
    public func clearSelection() {
        selectedId = nil
    }
    
    public var editMenuIsEnable: Bool {
        return selectedId != nil
    }
    
    public func deleteSelectedShape() {
        guard let selected = selectedId,
              let index = shapes.firstIndex(where: { $0.id == selected }) else {
            return
        }
        
        shapes.remove(at: index)
        clearSelection()
    }
}
