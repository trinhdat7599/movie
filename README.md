# 🎬 The Movie DB — Flutter Movie App

A beautiful Flutter movie application with a modern purple-themed UI inspired by Netflix and TMDB. Browse movies by category, discover popular titles, and view detailed movie information — all with smooth navigation across 3 core screens.

## Screenshots

| Onboard | Home | Show |
|---------|------|------|
| Full-screen banner of the most-viewed movie, brand logo, and "Get Started" CTA | Purple gradient header, search bar, category tabs, horizontal movie rows | Backdrop image, match %, synopsis, cast, genre chips, recommendations |

## Features

- **Onboard Screen** — Cinematic welcome page with the highest-viewed movie as a full-screen backdrop, brand identity, and a call-to-action button
- **Home Screen** — Purple gradient header with greeting, search bar, category tabs (Movies / Series / Anime / Novels), "Most Popular" and "Suggested for you" horizontal movie carousels
- **Show Screen** — Detailed movie view with backdrop image, circular match % indicator, release date & duration, synopsis, "Watch Trailer" button, main cast avatars, genre chips, and recommendations row
- **20 movies** with mock data across 8 genres (Action, Comedy, Drama, Horror, Sci-Fi, Romance, Animation, Thriller)
- **Dark theme** with purple accent (#7B2FF7) and smooth gradient designs
- **Cached network images** for fast loading with placeholders

## Project Structure

```
movie_app/
├── lib/
│   ├── main.dart                        # App entry point & MaterialApp setup
│   ├── models/
│   │   ├── movie.dart                   # Movie data model
│   │   └── category.dart                # Category data model
│   ├── screens/
│   │   ├── onboard_screen.dart          # Welcome / onboarding page
│   │   ├── home_screen.dart             # Main home with movie listings
│   │   └── show_screen.dart             # Movie detail / show page
│   ├── services/
│   │   └── movie_service.dart           # Mock data & movie queries
│   └── theme/
│       └── app_theme.dart               # Colors, gradients & ThemeData
├── pubspec.yaml
└── README.md
```

## Tech Stack

| Tool | Version |
|------|---------|
| Flutter | 3.29+ |
| Dart | 3.7+ |
| cached_network_image | ^3.3.1 |
| google_fonts | ^6.1.0 |
| flutter_rating_bar | ^4.0.1 |
| shimmer | ^3.0.0 |
