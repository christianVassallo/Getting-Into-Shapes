//
//  AnyShape.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

// Wrapper object for `Shape` protocol
//
// Used to make it easier to work with an array of shape dataModels and convert those into concrete instances of views conforming to `Shape`
struct AnyShape: Shape {
    
    let pathClosure: (CGRect) -> Path
    
    init<S: Shape>(base: S) {
        
        self.pathClosure = { rect in
            base.path(in: rect)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return pathClosure(rect)
    }
}
