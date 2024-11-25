//
//  ContentView.swift
//  SpeechTherapyApp
//
//  Created by Yong Zhong Rong on 24/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var nickname: String = "" // State variable for nickname input

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 0.82, blue: 0.86), Color(red: 0.9, green: 0.9, blue: 1.0)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Header
                Text("Hi there! 👋")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundColor(.purple)
                    .multilineTextAlignment(.center)

                // Text Input Field
                TextField("What's your nickname?", text: $nickname)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)

                // Next Button
                Button(action: {
                    print(nickname) // Action for button press
                }) {
                    Text("Next 🚀")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.8, green: 0.7, blue: 1.0))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
