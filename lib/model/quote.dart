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

  // Returns the text the first letter upper case
  get formattedText =>
      text.isEmpty ? '' : text[0].toUpperCase() + text.substring(1);

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

  compareTo(Quote b) {
    // compare by hotness, then likes, then dislikes, then reports
    if (hotness != b.hotness) {
      return b.hotness - hotness;
    } else if (likes != b.likes) {
      return b.likes - likes;
    } else if (dislikes != b.dislikes) {
      return b.dislikes - dislikes;
    } else {
      return b.reports - reports;
    }
  }
}
