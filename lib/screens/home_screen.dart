import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';
import '../theme/app_theme.dart';
import 'show_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  final _tabs = const ['Movies', 'Series', 'Anime', 'Novels'];
  late List<Movie> _allMovies;
  late List<Movie> _popularMovies;

  @override
  void initState() {
    super.initState();
    _allMovies = MovieService.getAllMovies();
    _popularMovies = MovieService.getPopularMovies();
  }

  void _openShow(Movie movie) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ShowScreen(movie: movie)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ══════════════════════════════════════════════════
            // ── Purple Header ────────────────────────────────
            // ══════════════════════════════════════════════════
            Container(
              decoration: const BoxDecoration(
                gradient: AppTheme.headerGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Top Row: greeting + avatar ──────
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'What do you want\nto watch today?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                              ),
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 2),
                              image: const DecorationImage(
                                image: NetworkImage('https://i.pravatar.cc/150?img=32'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // ── Search Bar ──────────────────────
                      Container(
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 14),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text('Search', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                            ),
                            const Spacer(),
                            Icon(Icons.search, color: Colors.white.withValues(alpha: 0.7), size: 22),
                            const SizedBox(width: 14),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ── Category Tabs ───────────────────
                      Row(
                        children: List.generate(_tabs.length, (i) {
                          final active = i == _selectedTab;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedTab = i),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: active ? AppTheme.primaryColor : Colors.white.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  _tabs[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),

                      // ── Movie Row (in header) ──────────
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _allMovies.length.clamp(0, 10),
                          itemBuilder: (_, i) {
                            final m = _allMovies[i];
                            return GestureDetector(
                              onTap: () => _openShow(m),
                              child: Container(
                                width: 120,
                                margin: const EdgeInsets.only(right: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: CachedNetworkImage(
                                    imageUrl: m.posterUrl,
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) => Container(color: Colors.white.withValues(alpha: 0.08)),
                                    errorWidget: (_, __, ___) => Container(
                                      color: Colors.white.withValues(alpha: 0.08),
                                      child: const Icon(Icons.movie, color: Colors.white30),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ══════════════════════════════════════════════════
            // ── Most Popular Section ─────────────────────────
            // ══════════════════════════════════════════════════
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 28, 20, 14),
              child: Text(
                'Most Popular',
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _popularMovies.length.clamp(0, 10),
                itemBuilder: (_, i) {
                  final m = _popularMovies[i];
                  return GestureDetector(
                    onTap: () => _openShow(m),
                    child: Container(
                      width: 130,
                      margin: const EdgeInsets.only(right: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: CachedNetworkImage(
                                imageUrl: m.posterUrl,
                                width: 130,
                                fit: BoxFit.cover,
                                placeholder: (_, __) => Container(color: AppTheme.cardColor),
                                errorWidget: (_, __, ___) => Container(
                                  color: AppTheme.cardColor,
                                  child: const Icon(Icons.movie, color: AppTheme.textMuted),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            m.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // ══════════════════════════════════════════════════
            // ── Suggested for you ────────────────────────────
            // ══════════════════════════════════════════════════
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 14),
              child: Text(
                'Suggested for you',
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _allMovies.length.clamp(0, 10),
                itemBuilder: (_, i) {
                  final idx = (_allMovies.length - 1 - i).clamp(0, _allMovies.length - 1);
                  final m = _allMovies[idx];
                  return GestureDetector(
                    onTap: () => _openShow(m),
                    child: Container(
                      width: 130,
                      margin: const EdgeInsets.only(right: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: CachedNetworkImage(
                                imageUrl: m.posterUrl,
                                width: 130,
                                fit: BoxFit.cover,
                                placeholder: (_, __) => Container(color: AppTheme.cardColor),
                                errorWidget: (_, __, ___) => Container(
                                  color: AppTheme.cardColor,
                                  child: const Icon(Icons.movie, color: AppTheme.textMuted),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            m.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
