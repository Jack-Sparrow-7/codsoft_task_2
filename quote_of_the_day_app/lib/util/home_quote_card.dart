import 'package:flutter/material.dart';
import 'package:quote_of_the_day_app/util/quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.currentQuote,
  });

  final Quote currentQuote;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 15,
      shadowColor: Colors.purple,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              currentQuote.text,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 25,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '- ${currentQuote.author}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
