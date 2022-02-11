//
//  ShapesView.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 11/2/22.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            Circle()
                .fill(Color.green)
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .position(x: (geometry.size.width * 0.30) - 50, y: (geometry.size.height * 0.25) - 50)
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .position(x: (geometry.size.width * 0.8) - 50, y: (geometry.size.height * 0.5) - 50)
            
            Capsule()
                .fill(Color.blue)
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .position(x: (geometry.size.width * 0.5) - 50, y: (geometry.size.height * 0.75) - 50)
            
        }
        
    }
}

