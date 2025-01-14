import 'package:flutter/material.dart';
import 'package:quote_of_the_day_app/util/favorite_quote_card.dart';
import 'package:quote_of_the_day_app/util/quote.dart';

class FavoriteBody extends StatefulWidget {
  final List<Quote> favorites;

  const FavoriteBody({super.key, required this.favorites});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 10,
        ),
        child: ListView.builder(
          itemCount: widget.favorites.length,
          itemBuilder: (context, index) {
            final quote = widget.favorites[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: FavoriteQuoteCard(
                quote: quote,
              ),
            );
          },
        ),
      ),
    );
  }
}
