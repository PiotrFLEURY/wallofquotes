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
      hotness: json['hotness'] ?? 0,
      likes: json['likes'] ?? 0,
      dislikes: json['dislikes'] ?? 0,
      reports: json['reports'] ?? 0,
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
    // compare by reports, then dislikes, then likes, then hotness
    if (reports != b.reports) {
      return reports - b.reports;
    } else if (dislikes != b.dislikes) {
      return dislikes - b.dislikes;
    } else if (likes != b.likes) {
      return likes - b.likes;
    } else if (hotness != b.hotness) {
      return hotness - b.hotness;
    } else if (text != b.text) {
      return text.compareTo(b.text);
    } else if (author != b.author) {
      return author.compareTo(b.author);
    } else {
      return id - b.id;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quote &&
        (id == other.id || text == other.text && author == other.author);
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ author.hashCode;

  @override
  String toString() {
    return 'Quote{id: $id, text: $text, author: $author, likes: $likes, dislikes: $dislikes, reports: $reports, hotness: $hotness}';
  }
}
