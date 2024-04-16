//
//  ContentView.swift
//  popoverView
//
//  Created by Nicholas McGinnis on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var displayPopover = false
    
    var body: some View {
        Button("Display Popover", systemImage: "hand.tap.fill") {
            displayPopover = true
        }
        .font(.title)
        .foregroundStyle(.orange)
        .popover(isPresented: $displayPopover) {
            Text("Hello World")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.purple)
                .underline()
            Text("Display your content here")
                .font(.footnote)
                .foregroundStyle(.teal)
        }
    }
}

#Preview {
    ContentView()
}
