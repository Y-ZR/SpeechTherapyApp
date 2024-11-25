//
//  SecondScreenView.swift
//  SpeechTherapyApp
//
//  Created by Your Name on 24/11/24.
//

import SwiftUI

struct SecondScreenView: View {
    var name: String // Receive the nickname passed from the previous page
    @State private var numericValue: Int = 5 // Default value for numeric input
    @State private var selectedEmoji: String? // State variable for selected emoji

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 0.82, blue: 0.86), Color(red: 0.9, green: 0.9, blue: 1.0)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Header
                VStack {
                    Text("Hi \(name) 😊,")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text("tell us more!")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                }

                // Numeric Input Field as part of a sentence
                HStack {
                    Text("I am")
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                    
                    Text("\(numericValue)")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                    
                    Text("years old")
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                    
                    Stepper("", value: $numericValue, in: 0...100)
                        .labelsHidden() // Hides the label so only buttons are visible
                        .padding(.leading, 10)
                }
                .padding()

                // Emoji Selection Buttons
                HStack(spacing: 20) {
                    EmojiButton(emoji: "👦🏻", isSelected: selectedEmoji == "👦🏻") {
                        selectedEmoji = "👦🏻"
                    }
                    EmojiButton(emoji: "🧒🏻", isSelected: selectedEmoji == "🧒🏻") {
                        selectedEmoji = "🧒🏻"
                    }
                    EmojiButton(emoji: "🌈", isSelected: selectedEmoji == "🌈") {
                        selectedEmoji = "🌈"
                    }
                }

                // Next Button
                Button(action: {
                    print("Numeric Value: \(numericValue), Selected Emoji: \(selectedEmoji ?? "None")")
                }) {
                    Text("Next 🎨")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
    }
}

// Custom button for emoji selection
struct EmojiButton: View {
    var emoji: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(emoji)
                .font(.system(size: 40))
                .frame(width: 70, height: 70)
                .background(isSelected ? Color.purple : Color(red: 0.9, green: 0.9, blue: 1.0))
                .cornerRadius(35)
                .shadow(radius: isSelected ? 5 : 0)
        }
    }
}

#Preview {
    SecondScreenView(name: "John") // Pass a sample name for preview
}
