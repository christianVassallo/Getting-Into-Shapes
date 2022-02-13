//
//  ShapeToolbar.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 13/2/22.
//

import SwiftUI

struct ShapeToolbar: View {
    
    let editMenuIsEnabled: Bool
    let createHandler: (() -> Void)
    let deleteHandler: (() -> Void)
    let colorChangeHandler: (() -> Void)
    
    var body: some View {
        
        Button("Create") {
            createHandler()
        }

        Spacer()

        Menu {
            Button(action: {
                deleteHandler()
            }) {
                Text("Delete")
                Image(systemName: "trash")
            }
            
            Divider()
            
            Button(action: {
                colorChangeHandler()
            }) {
                Text("Change Color")
                Image(systemName: "paintpalette")
            }
        } label: {
            Text("Edit Shape")
        }
        .disabled(!editMenuIsEnabled)
    }
}

