import 'package:flutter/material.dart';

class FavoriteAppbar extends StatefulWidget {
  const FavoriteAppbar({super.key});

  @override
  State<FavoriteAppbar> createState() => _FavoriteAppbarState();
}

class _FavoriteAppbarState extends State<FavoriteAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Favorite Quotes'),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      backgroundColor: Colors.purple,
      shadowColor: Colors.purpleAccent,
      elevation: 15,
    );
  }
}
