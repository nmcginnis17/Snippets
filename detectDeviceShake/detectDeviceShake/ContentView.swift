//
//  ContentView.swift
//  detectDeviceShake
//
//  Created by Nicholas McGinnis on 4/24/24.
//

import SwiftUI

struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceShakeNotification)) { _ in
                action()
            }
    }
}


struct ContentView: View {
    @State private var img = "swift"
    @State private var word = "SHAKE ME!"
    
    var body: some View {
        Spacer()
        VStack {
            Image(systemName: "\(img)")
            Text("\(word)")
        }
        .onShake {
            img = "tornado"
            word = "I AM SHOOK"
        }
        Spacer()
        Button {
            img = "swift"
            word = "SHAKE ME!"
        } label: {
            Text("RESET")
        }
    }
}

#Preview {
    ContentView()
}

/// EXTENSIONS
extension UIDevice {
    static let deviceShakeNotification = Notification.Name(rawValue: "deviceShakeNotification")
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceShakeNotification, object: nil)
        }
    }
}

extension View {
    func onShake(perform action: @escaping () -> ()) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
