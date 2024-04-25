//
//  ContentView.swift
//  detectDeviceRotation
//
//  Created by Nicholas McGinnis on 4/24/24.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

struct ContentView: View {
    
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        Group {
            if orientation.isPortrait {
                Text("portrait")
            } else if orientation.isLandscape {
                Text("landscape")
            } else if orientation.isFlat {
                Text("flat")
            } else {
                Text("unknown")
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> ()) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
