# Technical Decisions

## State Management

I chose Cubit (flutter_bloc) because it is lightweight, easy to understand, and suitable for a small application like this. It keeps the business logic separated from the UI and makes the code easier to maintain and test.

## Resume Playback

The current playback position is saved locally using SharedPreferences whenever the user pauses the video or exits the screen. When the course is opened again, the saved position is loaded and the video resumes from that point.

### Trade-offs

SharedPreferences is simple and sufficient for this assessment because only small amounts of data need to be stored. For a larger application, I would use Hive or a local database to support more complex offline data and better scalability.

## What I Would Improve

If I had more time, I would:

- Add full offline support with cached videos.
- Add custom video controls (forward, rewind, playback speed).
- Improve widget and unit test coverage.
- Introduce a Repository layer to better separate data sources.
- Add animations and skeleton loading placeholders.
- Improve accessibility and localization support.