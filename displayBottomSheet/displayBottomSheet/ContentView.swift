//
//  ContentView.swift
//  displayBottomSheet
//
//  Created by Nicholas McGinnis on 5/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingCredits = false
    
    var body: some View {
        Button("Show Credits") {
            showingCredits.toggle()
        }
        .sheet(isPresented: $showingCredits) {
            Text("This app was made with a Hacking with Swift tutorial")
                .presentationDetents([.medium, .large])
//                .presentationDetents([.fraction(0.15)])   /// PARTIAL SCREEN COVERAGE
//                .presentationDetents([.height(300)])  /// SPECIFY EXACT POINT HEIGHT
                .presentationDragIndicator(.hidden)
                .presentationCornerRadius(40)
        }
    }
}

#Preview {
    ContentView()
}
