import 'package:pocket/src/models/suggestion_model.dart';
import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  final SuggestionModel suggestionModel;
  final VoidCallback onDeleteCard;
  final VoidCallback onTap;

  const SuggestionCard({Key key, this.suggestionModel, this.onDeleteCard, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.0,
        width: 250.0,
        child: Stack(
          children: <Widget>[
            Card(
              color: Colors.yellow,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  suggestionModel.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: IconButton(
                icon: Icon(Icons.clear),
                onPressed: onDeleteCard,
                iconSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
