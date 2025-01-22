//
//  TestView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/20/25.
//

import Foundation

import SwiftUI

struct TestView: View {
    @State private var startAnimation: Bool = false

    var body: some View {
        // Animated background using ZStack and LinearGradient
        ZStack {
            LinearGradient(
                colors: [
                    .purple,
                    .blue],
                startPoint: startAnimation ? .topLeading : .bottomLeading,
                endPoint: startAnimation ? .bottomTrailing : .topTrailing
            )
            // Animation to toggle the gradient colors
            .onAppear {
                withAnimation(.linear(duration: 5.0).repeatForever()) {
                    startAnimation.toggle()
                }
            }
            
            // VStack containing Image and Text overlay
            VStack() {
                Image("Swift")
                // Text with title and styling
                Text("Animated background in SwiftUI")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
        // Ignore safe area to cover the entire screen
        .ignoresSafeArea()
    }
}

#Preview {
    TestView()
}
