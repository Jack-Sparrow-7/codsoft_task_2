import 'package:flutter/material.dart';
import 'package:quote_of_the_day_app/util/quote.dart';

class FavoriteQuoteCard extends StatefulWidget {
  final Quote quote;
  const FavoriteQuoteCard({super.key, required this.quote});
  @override
  State<FavoriteQuoteCard> createState() => _FavoriteQuoteCardState();
}

class _FavoriteQuoteCardState extends State<FavoriteQuoteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.purple,
      elevation: 15,
      child: ListTile(
        title: Text(
          widget.quote.text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          widget.quote.author,
          style: TextStyle(
            color: Colors.blueGrey.shade600,
          ),
        ),
        trailing: const Icon(Icons.favorite, color: Colors.red),
      ),
    );
  }
}
