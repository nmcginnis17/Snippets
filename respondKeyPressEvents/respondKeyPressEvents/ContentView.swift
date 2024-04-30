//
//  ContentView.swift
//  respondKeyPressEvents
//
//  Created by Nicholas McGinnis on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var focused: Bool
    @State private var key = ""
    
    var body: some View {
        Text(key)
            .focusable()
            .focused($focused)
            .onKeyPress { press in
                key += press.characters
                return .handled
            }
            .onAppear {
                focused = true
            }
    }
}

#Preview {
    ContentView()
}
