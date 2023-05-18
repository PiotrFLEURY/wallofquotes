class Quote {
  int id;
  String text;
  String author;
  int hotness;
  int likes;
  int dislikes;
  int reports;

  static var empty = Quote(text: '', author: '');

  Quote({
    this.id = 0,
    required this.text,
    required this.author,
    this.hotness = 0,
    this.likes = 0,
    this.dislikes = 0,
    this.reports = 0,
  });

  // from JSON
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['text'],
      author: json['author'],
      hotness: json['hotness'],
      likes: json['likes'],
      dislikes: json['dislikes'],
      reports: json['reports'],
    );
  }

  // to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author,
      'hotness': hotness,
      'likes': likes,
      'dislikes': dislikes,
      'reports': reports,
    };
  }

  Quote copyWith({
    String? text,
    String? author,
    int? hotness,
    int? likes,
    int? dislikes,
    int? reports,
  }) {
    return Quote(
      id: id,
      text: text ?? this.text,
      author: author ?? this.author,
      hotness: hotness ?? this.hotness,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      reports: reports ?? this.reports,
    );
  }
}