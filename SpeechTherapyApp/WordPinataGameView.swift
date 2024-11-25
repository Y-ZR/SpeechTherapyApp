import SwiftUI

struct WordPinataGameView: View {
    @State private var score: Int = 0 // State variable for the score
    @State private var isListening: Bool = false // State to manage microphone button state
    @State private var feedbackText: String = "Click the microphone to start speaking!"
    @State private var showMicrophoneAnimation: Bool = false // State for microphone button animation

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 1.0, green: 0.82, blue: 0.86),
                    Color(red: 0.9, green: 0.9, blue: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                // Ready Card
                VStack {
                    Text("🎯")
                        .font(.system(size: 60))
                    Text("Are you ready?")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.purple, lineWidth: 3)
                )
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                .padding(.horizontal)

                // Microphone Button
                Button(action: {
                    microphoneButtonTapped()
                }) {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .clipShape(Circle())
                        .scaleEffect(showMicrophoneAnimation ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: showMicrophoneAnimation)
                        .accessibilityLabel("Microphone button")
                        .accessibilityHint("Tap to start or stop recording")
                }

                // Feedback Text
                Text(feedbackText)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(.purple)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .accessibilityLabel(feedbackText)

                // Balloon Scorecard (Adjusted to be square)
                VStack {
                    Text("🪅")
                        .font(.system(size: 80))
                    Text("\(score)")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(Color.purple.opacity(0.7))
                        .cornerRadius(20)
                        .padding(.top, -10)
                }
                .padding()
                .frame(width: 200, height: 200) // Set fixed width and height to make it square
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.purple.opacity(0.5),
                            Color.pink.opacity(0.8)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.purple, lineWidth: 5)
                )
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                // Removed .padding(.horizontal) to keep the scorecard square
            }
            .padding(.vertical)
        }
    }

    // Placeholder function for microphone button action
    func microphoneButtonTapped() {
        isListening.toggle()
        showMicrophoneAnimation = isListening

        if isListening {
            feedbackText = "Listening..."
            // Placeholder for starting audio capture
            print("Listening...")
            // Simulate a successful pronunciation after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isListening = false
                showMicrophoneAnimation = false
                feedbackText = "Great job! 🎉"
                score += 1
            }
        } else {
            feedbackText = "Click the microphone to start speaking!"
            // Placeholder for stopping audio capture
            print("Stopped listening.")
        }
    }
}

#Preview {
    WordPinataGameView()
}
