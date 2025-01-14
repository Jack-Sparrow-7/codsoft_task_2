
import 'package:flutter/material.dart';
import 'package:quote_of_the_day_app/pages/favorite_page.dart';
import 'package:quote_of_the_day_app/util/quote.dart';

// ignore: must_be_immutable
class HomeAppbar extends StatefulWidget {
  List<Quote> favoriteQuotes;
  HomeAppbar({super.key, required this.favoriteQuotes});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Quote of the Day'),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 25,
      ),
      backgroundColor: Colors.blueGrey,
      shadowColor: Colors.blue,
      elevation: 15,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FavoritePage(favorites: widget.favoriteQuotes),
              ),
            );
          },
        ),
      ],
    );
  }
}
