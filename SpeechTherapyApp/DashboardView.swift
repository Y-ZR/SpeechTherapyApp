import SwiftUI

struct DashboardView: View {
    var username: String // Receive the username
    @State private var showComingSoonAlert: Bool = false // State for the locked card alert

    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 0.82, blue: 0.86),
                                                           Color(red: 0.9, green: 0.9, blue: 1.0)]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack(spacing: 20) {
                        // Header Section
                        VStack {
                            HStack {
                                Text("Welcome, \(username)!")
                                    .font(.system(size: 34, weight: .bold, design: .rounded))
                                    .foregroundColor(.purple)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.horizontal)

                            Text("Choose your adventure.")
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(.purple)
                        }
                        .padding(.top)
                        .padding(.bottom, 10)

                        // Activity Cards Section
                        VStack(spacing: 20) {
                            // Active Card - Word Piñata
                            CardView(
                                title: "Word Piñata",
                                subtitle: "Burst the Piñata with the right words!",
                                emoji: "🪅",
                                buttonText: "Play Now! 🎮",
                                buttonAction: {
                                    print("Word Piñata selected")
                                },
                                isActive: true
                            )

                            // Locked Cards
                            CardView(
                                title: "Story Time",
                                subtitle: "Build stories, word by word!",
                                emoji: "📚",
                                buttonText: "Play Now! 🎮",
                                buttonAction: {
                                    showComingSoonAlert = true
                                },
                                isActive: false
                            )

                            CardView(
                                title: "Bubble Shooter",
                                subtitle: "Shoot the bubbles away!",
                                emoji: "🫧",
                                buttonText: "Play Now! 🎮",
                                buttonAction: {
                                    showComingSoonAlert = true
                                },
                                isActive: false
                            )
                        }
                        .padding(.horizontal)
                        .alert(isPresented: $showComingSoonAlert) {
                            Alert(
                                title: Text("Coming Soon!"),
                                message: Text("This activity is coming soon! Stay tuned."),
                                dismissButton: .default(Text("Got it!"))
                            )
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}


// Reusable Card View
struct CardView: View {
    var title: String
    var subtitle: String
    var emoji: String
    var buttonText: String
    var buttonAction: () -> Void
    var isActive: Bool // Determines if the card is active or locked

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                // Emoji and Title
                HStack {
                    Text(emoji)
                        .font(.system(size: 40))
                    Spacer()
                }
                
                Text(title)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                
                Text(subtitle)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(.gray)
                
                // Button
                Button(action: buttonAction) {
                    Text(buttonText)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                .disabled(!isActive)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isActive ? Color.purple : Color.gray, lineWidth: 3)
            )
            
            // Overlay for inactive cards
            if !isActive {
                Color.black.opacity(0.5) // Semi-transparent overlay
                    .cornerRadius(20)
                VStack {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                }
            }
        }
    }
}


#Preview {
    DashboardView(username: "Sam") // Provide a sample username for preview
}
