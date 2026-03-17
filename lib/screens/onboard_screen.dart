import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/movie_service.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final topMovie = MovieService.getTop10ByViews().first;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ── Background Image (highest viewed movie) ─────────
          CachedNetworkImage(
            imageUrl: topMovie.backdropUrl,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: AppTheme.surfaceDark),
            errorWidget: (_, __, ___) => Container(color: AppTheme.surfaceDark),
          ),

          // ── Gradient overlay ────────────────────────────────
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.2),
                  AppTheme.surfaceDark.withValues(alpha: 0.85),
                  AppTheme.surfaceDark,
                ],
                stops: const [0.0, 0.35, 0.6, 0.78],
              ),
            ),
          ),

          // ── Bottom Content ──────────────────────────────────
          Positioned(
            left: 24,
            right: 24,
            bottom: mq.padding.bottom + 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo / Brand
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'THE MOVIE DB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Title with colored keyword
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(text: 'All about '),
                      TextSpan(text: 'movies', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.w800)),
                      TextSpan(text: ',\nseries, '),
                      TextSpan(text: 'anime', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.w800)),
                      TextSpan(text: ' and\nmuch more.'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Subtitle
                const Text(
                  'Stay up to date with movies,\nseries, anime and much more.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 28),

                // CTA Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 8,
                      shadowColor: AppTheme.primaryColor.withValues(alpha: 0.4),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
