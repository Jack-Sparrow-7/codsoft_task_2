
class Quote {
  final String text;
  final String author;
  final bool isFavorite;

  Quote({
    required this.text,
    required this.author,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'author': author,
        'isFavorite': isFavorite,
      };

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        text: json['text'],
        author: json['author'],
        isFavorite: json['isFavorite'] ?? false,
      );
}
