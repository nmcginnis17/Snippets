//
//  ContentView.swift
//  showAltOnLightVsDarkMode
//
//  Created by Nicholas McGinnis on 4/18/24.
//

import SwiftUI

struct AdaptiveView<D: View, L: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let dark: D
    let light: L
    
    init(dark: D, light: L) {
        self.dark = dark
        self.light = light
    }
    
    init(dark: () -> D, light: () -> L) {
        self.dark = dark()
        self.light = light()
    }
    
    @ViewBuilder var body: some View {
        if colorScheme == .dark {
            dark
        } else {
            light
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            AdaptiveView {
                VStack {
                    Text("Dark Mode")
                    Image(systemName: "moon")
                        .foregroundStyle(.blue)
                }
            } light: {
                VStack {
                    Text("Light Mode")
                    Image(systemName: "sun.max")
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
