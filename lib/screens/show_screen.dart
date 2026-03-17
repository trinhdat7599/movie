import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';
import '../theme/app_theme.dart';

class ShowScreen extends StatelessWidget {
  final Movie movie;
  const ShowScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final matchPercent = (movie.rating * 10).toInt();
    // recommendations = other movies in same genres
    final recs = MovieService.getAllMovies().where((m) => m.id != movie.id).toList()..shuffle(Random(movie.id));
    final recommendations = recs.take(6).toList();

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          // ══════════════════════════════════════════════════
          // ── Backdrop with Back + Heart ──────────────────
          // ══════════════════════════════════════════════════
          SliverToBoxAdapter(
            child: Stack(
              children: [
                // backdrop image
                SizedBox(
                  width: double.infinity,
                  height: mq.size.height * 0.38,
                  child: CachedNetworkImage(
                    imageUrl: movie.backdropUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(color: AppTheme.cardColor),
                    errorWidget: (_, __, ___) => Container(color: AppTheme.cardColor),
                  ),
                ),
                // gradient fade
                Positioned(
                  left: 0, right: 0, bottom: 0,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppTheme.backgroundColor],
                      ),
                    ),
                  ),
                ),
                // back
                Positioned(
                  top: mq.padding.top + 8,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                        const SizedBox(width: 4),
                        const Text('Back', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                // heart
                Positioned(
                  top: mq.padding.top + 8,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${movie.title} added to favorites'), backgroundColor: AppTheme.primaryColor, behavior: SnackBarBehavior.floating),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite_border, color: AppTheme.heartColor, size: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ══════════════════════════════════════════════════
          // ── Match % + Title + Meta ─────────────────────
          // ══════════════════════════════════════════════════
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // circular progress
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            value: movie.rating / 10,
                            strokeWidth: 4,
                            backgroundColor: AppTheme.textMuted.withValues(alpha: 0.3),
                            valueColor: const AlwaysStoppedAnimation(AppTheme.greenAccent),
                          ),
                        ),
                        Text(
                          '$matchPercent%',
                          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  // title + meta
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${movie.title} (${movie.releaseDate.substring(0, 4)})',
                          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              movie.releaseDate,
                              style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                            ),
                            const SizedBox(width: 6),
                            const Text('•', style: TextStyle(color: AppTheme.textMuted)),
                            const SizedBox(width: 6),
                            const Icon(Icons.access_time, color: AppTheme.textSecondary, size: 13),
                            const SizedBox(width: 3),
                            Text(
                              movie.formattedDuration,
                              style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ══════════════════════════════════════════════════
          // ── Synopsis ───────────────────────────────────
          // ══════════════════════════════════════════════════
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                movie.overview,
                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.6),
              ),
            ),
          ),

          // ══════════════════════════════════════════════════
          // ── Watch Trailer Button ───────────────────────
          // ══════════════════════════════════════════════════
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Playing trailer for ${movie.title}...'), backgroundColor: AppTheme.primaryColor, behavior: SnackBarBehavior.floating),
                    );
                  },
                  icon: const Icon(Icons.play_circle_outline, size: 22),
                  label: const Text('Watch Trailer', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 6,
                    shadowColor: AppTheme.primaryColor.withValues(alpha: 0.4),
                  ),
                ),
              ),
            ),
          ),

          // ══════════════════════════════════════════════════
          // ── Main Cast ──────────────────────────────────
          // ══════════════════════════════════════════════════
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Main Cast', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movie.cast.length,
                      itemBuilder: (_, i) {
                        final name = movie.cast[i];
                        final initials = name.split(' ').map((w) => w[0]).join();
                        return Container(
                          width: 70,
                          margin: const EdgeInsets.only(right: 14),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundColor: AppTheme.cardColor,
                                child: Text(initials, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 10),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ══════════════════════════════════════════════════
          // ── Categories ─────────────────────────────────
          // ══════════════════════════════════════════════════
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Category(s)', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: movie.genres.map((g) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppTheme.cardColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppTheme.textMuted.withValues(alpha: 0.3)),
                        ),
                        child: Text(g, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          // ══════════════════════════════════════════════════
          // ── Recommendations ────────────────────────────
          // ══════════════════════════════════════════════════
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 8),
              child: const Text('Recommendations', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: recommendations.length,
                itemBuilder: (_, i) {
                  final m = recommendations[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ShowScreen(movie: m)));
                    },
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
                                errorWidget: (_, __, ___) => Container(color: AppTheme.cardColor, child: const Icon(Icons.movie, color: AppTheme.textMuted)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(m.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // bottom spacer
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
