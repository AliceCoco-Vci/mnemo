class ThemeAsset {
  final String id;
  final String path;
  final String type;

  const ThemeAsset({required this.id, required this.path, required this.type});
}

enum WallpaperFit { cover, contain, fill, tile }

class ThemeWallpaper {
  final String assetId;
  final WallpaperFit fit;
  final double opacity;

  const ThemeWallpaper({
    required this.assetId,
    this.fit = WallpaperFit.cover,
    this.opacity = 1,
  });
}
