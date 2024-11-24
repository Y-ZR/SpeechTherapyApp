### **App Overview**
This app is a **Speech Therapy App MVP** with the primary goal of teaching pronunciation and correcting pronunciation errors. The app should be functional and simple, focusing on the following core features and UI elements as outlined in the wireframe:

---

### **1. User Interface Layout**
#### **Main Screen Components:**
1. **Header Section**: 
   - Displays the game title (e.g., "Piñata Game").
   - Option to include a brief motivational tagline.

2. **Interactive Area**: 
   - Central area for the game mechanics:
     - A visual representation of the piñata that the user interacts with when pronouncing words.
     - Animated effects triggered by correct or incorrect pronunciations.

3. **Feedback Section**:
   - Displays real-time feedback:
     - Encourages correct pronunciation.
     - Highlights errors and provides tips for improvement.

4. **Control Buttons**:
   - **Start/Stop Button**: To begin or end the pronunciation game.
   - **Settings Button**: Opens a menu to configure difficulty levels, select words, or toggle audio feedback.

5. **Scoreboard/Progress Tracker**:
   - Tracks user progress, such as scores, streaks, or levels.

---

### **2. Core Functionalities**
#### **Game Mechanics:**
- The app listens to the user’s pronunciation using the microphone.
- Processes audio input to compare with the correct pronunciation (using a custom built speech recognition API).
- Animates the piñata based on pronunciation accuracy:
  - Accurate pronunciation triggers a "hit" animation.
  - Incorrect pronunciation provides constructive feedback without advancing the game.

#### **Feedback System:**
- Highlights errors and suggests correct pronunciation.
- Optional phonetic spelling or syllable breakdown of the words.

#### **Scoring Mechanism:**
- Points awarded for correct pronunciation.
- Deduct points or provide hints for repeated mistakes.

---