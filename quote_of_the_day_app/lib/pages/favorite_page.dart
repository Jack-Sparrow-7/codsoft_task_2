import 'package:flutter/material.dart';
import 'package:quote_of_the_day_app/util/favorite_app_bar.dart';
import 'package:quote_of_the_day_app/util/favorite_body.dart';
import 'package:quote_of_the_day_app/util/quote.dart';

class FavoritePage extends StatelessWidget {
  final List<Quote> favorites;

  const FavoritePage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70), child: FavoriteAppbar()),
      body: FavoriteBody(favorites: favorites),
    );
  }
}
