//
//  ShapeCanvasViewModel.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

class ShapeCanvasViewModel: ObservableObject {
    
    @Published public private(set) var shapes: [DrawableShape] = [
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random(),
        DrawableShape.random()
    ]
    
    @Published public private(set) var selectedIndex: Int?
    
    // dict of shape id to position
    var shapePositions: [String: CGPoint] = [:]
    
    // creates a shap view given an index and a rect for it to be positioned in
    public func createInteractableShape(for index: Int, in rect: CGRect, onTap: @escaping (() -> Void)) -> some View {

        let shape = shapes[index]
        
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
            isSelected: index == selectedIndex,
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
    
    public func selectShape(at index: Int) {
        selectedIndex = index
    }
    
    public func clearSelection() {
        selectedIndex = nil
    }
    
    public var editMenuIsEnable: Bool {
        return selectedIndex != nil
    }
    
    public func deleteSelectedShape() {
        guard let index = selectedIndex else { return }
        shapes.remove(at: index)
    }
}
