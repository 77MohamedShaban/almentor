class Course {
  final String? id;
  final String? title;
  final String? thumbnailUrl;
  final int? durationSeconds;
  final String? description;
  final String? videoUrl;
  final double progress;
  final int positionInSeconds;


  Course({
     this.id,
     this.title,
     this.thumbnailUrl,
     this.durationSeconds,
     this.description,
     this.videoUrl, this.progress =0, this.positionInSeconds = 0,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json["id"],
      title: json["title"],
      thumbnailUrl: json["thumbnailUrl"],
      durationSeconds: json["durationSeconds"],
      description: json["description"],
      videoUrl: json["videoUrl"],
    );
  }
}