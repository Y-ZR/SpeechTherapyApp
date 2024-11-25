//
//  ContentView.swift
//  SpeechTherapyApp
//
//  Created by Yong Zhong Rong on 24/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var nickname: String = "" // State variable for nickname input
    @State private var path: [String] = [] // Path array for navigation stack

    var body: some View {
        NavigationStack(path: $path) { // Bind the path to NavigationStack
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
                        if !nickname.isEmpty {
                            path.append(nickname) // Append nickname to path for navigation
                        }
                    }) {
                        Text("Next 🚀")
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(nickname.isEmpty ? Color.gray : Color(red: 0.8, green: 0.7, blue: 1.0))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .disabled(nickname.isEmpty) // Disable button if nickname is empty
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()
            }
            .navigationDestination(for: String.self) { name in
                SecondScreenView(name: name)
            }
        }
    }
}

#Preview {
    ContentView()
}
