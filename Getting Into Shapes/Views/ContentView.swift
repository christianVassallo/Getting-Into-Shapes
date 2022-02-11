//
//  ContentView.swift
//  Getting Into Shapes
//
//  Created by Christian Vassallo on 10/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ShapeCanvas()
                .navigationTitle("Getting Into Shapes")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
