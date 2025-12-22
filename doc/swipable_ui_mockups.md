# Swipable UI Mockups

This document outlines the design concept for a Tinder-like swipable interface for citizen submissions. The goal is to create a mobile-first, user-friendly experience.

## Design Overview

### Key Features

1. **Card-Based Layout**:
   - Each submission field (e.g., title, description, location) is presented as a separate card.
   - Users swipe left to skip or right to proceed to the next field.

2. **Progress Indicator**:
   - A progress bar at the top shows the user's progress through the submission process.

3. **Interactive Feedback**:
   - Cards provide real-time validation feedback (e.g., "Title is required").

4. **Mobile Optimization**:
   - Fully responsive design with touch gestures for swiping.

5. **Privacy Options**:
   - Users can toggle between anonymous and contact-sharing modes.

## Mockup Details

### Card Layout

- **Title Card**:
  - Input field for the idea title.
  - Swipe right to save and proceed.
- **Description Card**:
  - Text area for detailed description.
  - Swipe right to save and proceed.
- **Location Card**:
  - Dropdown for selecting the ward/location.
  - Swipe right to save and proceed.
- **Topic Card**:
  - Dropdown for selecting a topic.
  - If "Other" is selected, a new card appears for specifying the topic.
- **Privacy Card**:
  - Options for anonymity or sharing contact info.
  - Swipe right to save and proceed.

### Navigation

- **Swipe Left**:
  - Skip the current card (if optional).
- **Swipe Right**:
  - Save the input and proceed to the next card.
- **Progress Bar**:
  - Updates dynamically as the user progresses.

### Visual Design

- **Colors**:
  - Use NairobiTalks branding colors (blue, white, and green).
- **Icons**:
  - Use Bootstrap icons for visual cues (e.g., checkmarks, arrows).
- **Typography**:
  - Clear, readable fonts for mobile screens.

---

This mockup serves as the foundation for implementing the swipable UI. The next step is to translate this design into a functional interface using Ruby gems like StimulusReflex or Motion.
