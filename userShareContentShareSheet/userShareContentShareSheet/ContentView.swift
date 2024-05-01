//
//  ContentView.swift
//  userShareContentShareSheet
//
//  Created by Nicholas McGinnis on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    let link = URL(string: "https://www.swift.org")

    var body: some View {
        Spacer()
        /// SHARE LINK OPTIONS
        VStack(spacing: 20) {
            ShareLink(item: link!)
            ShareLink("Swift.org", item: link!)
            ShareLink(item: link!) {
                Label("Get Swifty", systemImage: "swift")
            }
            ShareLink(item: link!, message: Text("Swift Language Site"))
        }
        Spacer()
        /// GENERATE PREVIEW
        VStack {
            ShareLink(
                item: link!,
                preview: SharePreview(
                    "Swift is the best!",
                    image: Image(systemName: "sparkles")
                )
            )
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
