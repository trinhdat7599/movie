import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../models/category.dart';

class MovieService {
  // ── Categories ──────────────────────────────────────────────────────
  static List<Category> getCategories() {
    return const [
      Category(
        id: 1,
        name: 'Action',
        icon: Icons.local_fire_department,
        imageUrl: 'https://image.tmdb.org/t/p/w500/8YFL5QQVPy3AgrEQxNYVSgiPEbe.jpg',
      ),
      Category(
        id: 2,
        name: 'Comedy',
        icon: Icons.sentiment_very_satisfied,
        imageUrl: 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911BTUgMe1nFGDB.jpg',
      ),
      Category(
        id: 3,
        name: 'Drama',
        icon: Icons.theater_comedy,
        imageUrl: 'https://image.tmdb.org/t/p/w500/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg',
      ),
      Category(
        id: 4,
        name: 'Horror',
        icon: Icons.visibility_off,
        imageUrl: 'https://image.tmdb.org/t/p/w500/pHkKbIRoCe7zIFvqan9LFSaQAde.jpg',
      ),
      Category(
        id: 5,
        name: 'Sci-Fi',
        icon: Icons.rocket_launch,
        imageUrl: 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      ),
      Category(
        id: 6,
        name: 'Romance',
        icon: Icons.favorite,
        imageUrl: 'https://image.tmdb.org/t/p/w500/3GrRgt6CiLIUXUtoktcv1g2iwT5.jpg',
      ),
      Category(
        id: 7,
        name: 'Animation',
        icon: Icons.animation,
        imageUrl: 'https://image.tmdb.org/t/p/w500/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg',
      ),
      Category(
        id: 8,
        name: 'Thriller',
        icon: Icons.psychology,
        imageUrl: 'https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
      ),
    ];
  }

  // ── All Movies ──────────────────────────────────────────────────────
  static List<Movie> getAllMovies() {
    return const [
      // ── Action ──
      Movie(
        id: 1,
        title: 'The Dark Knight',
        overview:
            'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911BTUgMe1nFGDB.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/nMKdUUepR0i5zn0y1T4CsSB5ez.jpg',
        rating: 9.0,
        views: 12500000,
        releaseDate: '2008-07-18',
        duration: 152,
        genres: ['Action', 'Crime', 'Drama'],
        director: 'Christopher Nolan',
        cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart', 'Morgan Freeman'],
      ),
      Movie(
        id: 2,
        title: 'Mad Max: Fury Road',
        overview:
            'An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/nlCHUWjY9XWbuEUQauCBgnY8ymF.jpg',
        rating: 8.1,
        views: 8900000,
        releaseDate: '2015-05-15',
        duration: 120,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        director: 'George Miller',
        cast: ['Tom Hardy', 'Charlize Theron', 'Nicholas Hoult'],
      ),
      Movie(
        id: 3,
        title: 'John Wick: Chapter 4',
        overview:
            'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/vZloFAK7NmvMGKE7LsyZHBRaIWE.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/7I6VUdPj6tQECNHdviJkUHD2u89.jpg',
        rating: 7.7,
        views: 7200000,
        releaseDate: '2023-03-24',
        duration: 169,
        genres: ['Action', 'Thriller', 'Crime'],
        director: 'Chad Stahelski',
        cast: ['Keanu Reeves', 'Donnie Yen', 'Bill Skarsgård'],
      ),

      // ── Comedy ──
      Movie(
        id: 4,
        title: 'The Grand Budapest Hotel',
        overview:
            'The adventures of Gustave H, a legendary concierge at a famous European hotel between the wars, and Zero Moustafa, the lobby boy who becomes his most trusted friend.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/eWdyYQreja6JGCzqHWXpWHDrrPo.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/nX5XotM9yprCKarRH4fzOq5jCmN.jpg',
        rating: 8.1,
        views: 6100000,
        releaseDate: '2014-03-28',
        duration: 99,
        genres: ['Comedy', 'Drama', 'Adventure'],
        director: 'Wes Anderson',
        cast: ['Ralph Fiennes', 'Tony Revolori', 'F. Murray Abraham'],
      ),
      Movie(
        id: 5,
        title: 'Superbad',
        overview:
            'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-fueled party goes awry.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/ek8e8txUyUwd2BNqj6lFEerJfbq.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/42LMIajdo91On9CyGMwFf3ZTUF9.jpg',
        rating: 7.6,
        views: 5400000,
        releaseDate: '2007-08-17',
        duration: 113,
        genres: ['Comedy'],
        director: 'Greg Mottola',
        cast: ['Jonah Hill', 'Michael Cera', 'Christopher Mintz-Plasse'],
      ),

      // ── Drama ──
      Movie(
        id: 6,
        title: 'The Shawshank Redemption',
        overview:
            'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg',
        rating: 9.3,
        views: 15000000,
        releaseDate: '1994-09-23',
        duration: 142,
        genres: ['Drama'],
        director: 'Frank Darabont',
        cast: ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
      ),
      Movie(
        id: 7,
        title: 'Forrest Gump',
        overview:
            'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/7c9UVPPiTPltouxRVY6N9uugaVA.jpg',
        rating: 8.8,
        views: 13200000,
        releaseDate: '1994-07-06',
        duration: 142,
        genres: ['Drama', 'Romance'],
        director: 'Robert Zemeckis',
        cast: ['Tom Hanks', 'Robin Wright', 'Gary Sinise'],
      ),
      Movie(
        id: 8,
        title: 'The Godfather',
        overview:
            'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/tmU7GeKVybMWFButWEGl2M4GeiP.jpg',
        rating: 9.2,
        views: 14000000,
        releaseDate: '1972-03-24',
        duration: 175,
        genres: ['Drama', 'Crime'],
        director: 'Francis Ford Coppola',
        cast: ['Marlon Brando', 'Al Pacino', 'James Caan'],
      ),

      // ── Horror ──
      Movie(
        id: 9,
        title: 'Get Out',
        overview:
            'A young African-American visits his white girlfriend\'s parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/tFXcEccSQMf3lfhfXKSU9iRBpa3.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/szOiasYJbrgFP8LZBGCBKdUByVR.jpg',
        rating: 7.7,
        views: 6800000,
        releaseDate: '2017-02-24',
        duration: 104,
        genres: ['Horror', 'Thriller', 'Mystery'],
        director: 'Jordan Peele',
        cast: ['Daniel Kaluuya', 'Allison Williams', 'Bradley Whitford'],
      ),
      Movie(
        id: 10,
        title: 'A Quiet Place',
        overview:
            'In a post-apocalyptic world, a family is forced to live in silence while hiding from monsters with ultra-sensitive hearing.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/nAU74GmpUk7t5iklEp3bufwDq4n.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/roYyPiQDQKmIKUEhO2f8Eof147G.jpg',
        rating: 7.5,
        views: 5800000,
        releaseDate: '2018-04-06',
        duration: 90,
        genres: ['Horror', 'Drama', 'Sci-Fi'],
        director: 'John Krasinski',
        cast: ['Emily Blunt', 'John Krasinski', 'Millicent Simmonds'],
      ),

      // ── Sci-Fi ──
      Movie(
        id: 11,
        title: 'Interstellar',
        overview:
            'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/xJHokMbljvjADYdit5fK1DVfjko.jpg',
        rating: 8.6,
        views: 11000000,
        releaseDate: '2014-11-07',
        duration: 169,
        genres: ['Sci-Fi', 'Adventure', 'Drama'],
        director: 'Christopher Nolan',
        cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
      ),
      Movie(
        id: 12,
        title: 'Inception',
        overview:
            'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/s3TBrRGB1iav7gFOCNx3H31MoES.jpg',
        rating: 8.8,
        views: 13500000,
        releaseDate: '2010-07-16',
        duration: 148,
        genres: ['Sci-Fi', 'Action', 'Adventure'],
        director: 'Christopher Nolan',
        cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Elliot Page'],
      ),
      Movie(
        id: 13,
        title: 'Blade Runner 2049',
        overview:
            'Young Blade Runner K\'s discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who\'s been missing for thirty years.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/sAtoMqDVhNDQBc3QJL3RF6hlhGq.jpg',
        rating: 8.0,
        views: 7500000,
        releaseDate: '2017-10-06',
        duration: 164,
        genres: ['Sci-Fi', 'Drama', 'Mystery'],
        director: 'Denis Villeneuve',
        cast: ['Ryan Gosling', 'Harrison Ford', 'Ana de Armas'],
      ),
      Movie(
        id: 14,
        title: 'Dune',
        overview:
            'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/jYEW5xZkZk2WTrdbMGAPFuBqbDc.jpg',
        rating: 8.0,
        views: 9200000,
        releaseDate: '2021-10-22',
        duration: 155,
        genres: ['Sci-Fi', 'Adventure', 'Drama'],
        director: 'Denis Villeneuve',
        cast: ['Timothée Chalamet', 'Rebecca Ferguson', 'Zendaya'],
      ),

      // ── Romance ──
      Movie(
        id: 15,
        title: 'La La Land',
        overview:
            'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/nadTlnTE6DzKAMGTkMFSKOiCiar.jpg',
        rating: 8.0,
        views: 8500000,
        releaseDate: '2016-12-09',
        duration: 128,
        genres: ['Romance', 'Comedy', 'Drama'],
        director: 'Damien Chazelle',
        cast: ['Ryan Gosling', 'Emma Stone', 'John Legend'],
      ),

      // ── Animation ──
      Movie(
        id: 16,
        title: 'Spider-Man: Into the Spider-Verse',
        overview:
            'Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/7d6EY00g1c39SGZOoCJ5Py9nNth.jpg',
        rating: 8.4,
        views: 9800000,
        releaseDate: '2018-12-14',
        duration: 117,
        genres: ['Animation', 'Action', 'Adventure'],
        director: 'Bob Persichetti',
        cast: ['Shameik Moore', 'Jake Johnson', 'Hailee Steinfeld'],
      ),
      Movie(
        id: 17,
        title: 'Spirited Away',
        overview:
            'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/bSvUW4JA2u0yhHAxwsFBB7ZQvZe.jpg',
        rating: 8.6,
        views: 10500000,
        releaseDate: '2001-07-20',
        duration: 125,
        genres: ['Animation', 'Fantasy', 'Adventure'],
        director: 'Hayao Miyazaki',
        cast: ['Rumi Hiiragi', 'Miyu Irino', 'Mari Natsuki'],
      ),

      // ── Thriller ──
      Movie(
        id: 18,
        title: 'Parasite',
        overview:
            'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/TU9GocmSOMNJNeYvNfKHpnqYCGM.jpg',
        rating: 8.5,
        views: 10200000,
        releaseDate: '2019-05-30',
        duration: 132,
        genres: ['Thriller', 'Comedy', 'Drama'],
        director: 'Bong Joon-ho',
        cast: ['Song Kang-ho', 'Lee Sun-kyun', 'Cho Yeo-jeong'],
      ),
      Movie(
        id: 19,
        title: 'Gone Girl',
        overview:
            'With his wife\'s disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it\'s suspected that he may not be innocent.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/lv5xShBIDPe85o4jgsloPELfSQY.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/qqHQsStV6exghCM7zbObuYBiYxw.jpg',
        rating: 8.1,
        views: 7800000,
        releaseDate: '2014-10-03',
        duration: 149,
        genres: ['Thriller', 'Drama', 'Mystery'],
        director: 'David Fincher',
        cast: ['Ben Affleck', 'Rosamund Pike', 'Neil Patrick Harris'],
      ),
      Movie(
        id: 20,
        title: 'Oppenheimer',
        overview:
            'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.',
        posterUrl: 'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
        backdropUrl: 'https://image.tmdb.org/t/p/w1280/nb3xI8XI3w4pMVZ38VijbsyBqP4.jpg',
        rating: 8.5,
        views: 11500000,
        releaseDate: '2023-07-21',
        duration: 180,
        genres: ['Thriller', 'Drama', 'History'],
        director: 'Christopher Nolan',
        cast: ['Cillian Murphy', 'Emily Blunt', 'Robert Downey Jr.'],
      ),
    ];
  }

  // ── Popular Movies (sorted by rating) ────────────────────────────
  static List<Movie> getPopularMovies() {
    final movies = List<Movie>.of(getAllMovies());
    movies.sort((a, b) => b.rating.compareTo(a.rating));
    return movies;
  }

  // ── Top 10 Movies by Views ──────────────────────────────────────
  static List<Movie> getTop10ByViews() {
    final movies = List<Movie>.of(getAllMovies());
    movies.sort((a, b) => b.views.compareTo(a.views));
    return movies.take(10).toList();
  }

  // ── Movies by Category ──────────────────────────────────────────
  static List<Movie> getMoviesByCategory(String categoryName) {
    return getAllMovies()
        .where((movie) => movie.genres
            .map((g) => g.toLowerCase())
            .contains(categoryName.toLowerCase()))
        .toList();
  }
}
