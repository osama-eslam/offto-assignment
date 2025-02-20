# Hotel Booking App

I developed this Flutter application as a hotel booking system that allows users to search for hotels by city, select dates, and specify the number of passengers and rooms. The app supports both Arabic and English languages, includes light/dark theme support, and follows a clean, feature-based folder structure using BLoC for state management.

## Features Implemented

### 1. Multi-Language Support

- I implemented support for both Arabic and English.
- I integrated localization to ensure text and UI elements change dynamically based on the selected language.

### 2. Theme Support

- I implemented both light and dark themes.
- I allowed users to switch between themes dynamically.
- I used BLoC to manage theme state across the app.

### 3. Search for Cities

- I integrated an API to fetch cities based on user input.
- I displayed a `BottomModalSheet` containing a search field and a dynamically updating list of cities.
- I sent API requests with each keystroke to update the list of cities in real-time.

### 4. Date Range Picker

- I implemented a calendar widget to allow users to select a start date and an end date.
- I highlighted selected dates and disabled invalid dates (e.g., past dates).

### 5. Passengers and Rooms Selection

- I allowed users to specify the number of rooms, adults, children, and infants.
- I ensured that each room contains at least one adult.
- I applied validation rules:
  - Adults: Min 1, Max 6
  - Children: Min 0, Max 4
  - Infants: Min 0, Max 4
  - Rooms: Min 1, Max 4
- I implemented an intuitive UI with a ticket-style interface and collapsible room selection.

### 6. Navigation

- I added navigation buttons for "Flights" and "Packages" that lead to corresponding empty pages.
- I implemented navigation to a "Search Results" page when the user clicks the Search button.

### 7. API Integration

- I used the provided API to fetch city data:
  - Endpoint: `POST https://front.test.offto.com.kw/api/v1/get_all_cities`
  - Request Body: `{"search":"test in cities field"}`
  - Response: A list of countries with their respective cities.
  - I displayed only the city names in the search results.
- I passed the `Accept-Language` header (`ar` or `en`) in API requests to retrieve localized values.

### 8. UI/UX

- I matched the UI closely with the provided design screenshots.
- I ensured responsiveness for different screen sizes.
- I designed the "Passengers & Rooms" selection screen with:
  - Proper text size adjustments.
  - Separate (+) and (-) buttons from the number.
  - Automatic collapsing of previously selected rooms when a new room is added.
  - A ticket-style layout for room selection.
  - Proper alignment of the top title "Passengers & Rooms" to the left.

## Folder Structure

- I followed a clean, feature-based folder structure to ensure maintainability.
- I separated concerns for UI, state management, and business logic using the BLoC pattern.

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone <repository-link>
   cd hotel_booking_app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Deliverables

- I pushed the code to the GitHub repository.
- I generated and provided a release APK file of the app.

## Screenshots

1. Home Page
2. Search Cities
3. Search Start and End Date
4. Search Passengers & Rooms
5. Home Page After Updating the Fields

---

I completed this project within the given 4-day timeframe, incorporating all required features while ensuring a smooth user experience with a clean and maintainable code structure.
