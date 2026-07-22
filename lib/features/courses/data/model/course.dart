class Course {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final String description;
  final String videoUrl;
  final double progress;

  const Course({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.description,
    required this.videoUrl,
    this.progress = 0,
  });
}