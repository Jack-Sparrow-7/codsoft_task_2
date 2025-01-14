import 'package:flutter/material.dart';
import 'package:quote_of_the_day_app/util/home_app_bar.dart';
import 'package:quote_of_the_day_app/util/home_quote_card.dart';
import 'package:quote_of_the_day_app/util/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Quote currentQuote = Quote(
    text: ".........",
    author: ".....",
  );

  List<Quote> favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    _loadQuoteOfTheDay();
    _loadFavorites();
  }

  Future<void> _loadQuoteOfTheDay() async {
    final url = Uri.parse("https://zenquotes.io/api/random");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          currentQuote = Quote(
            text: data[0]['q'],
            author: data[0]['a'],
          );
        });
      } else {
        throw Exception('Failed to fetch quote');
      }
    } catch (e) {
      debugPrint("Failed to fetch");
    }
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favorites') ?? [];

    setState(() {
      favoriteQuotes = favoritesJson
          .map((json) => Quote.fromJson(jsonDecode(json)))
          .toList();
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      if (favoriteQuotes.any((q) => q.text == currentQuote.text)) {
        favoriteQuotes.removeWhere((q) => q.text == currentQuote.text);
      } else {
        favoriteQuotes.add(Quote(
          text: currentQuote.text,
          author: currentQuote.author,
          isFavorite: true,
        ));
      }
    });

    await prefs.setStringList(
      'favorites',
      favoriteQuotes.map((q) => jsonEncode(q.toJson())).toList(),
    );
  }

  void _shareQuote() {
    Share.share('"${currentQuote.text}" - ${currentQuote.author}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: HomeAppbar(
            favoriteQuotes: favoriteQuotes,
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuoteCard(currentQuote: currentQuote),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      favoriteQuotes.any((q) => q.text == currentQuote.text)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: _shareQuote,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadQuoteOfTheDay,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
