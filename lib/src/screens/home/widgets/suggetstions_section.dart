import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/blocs/map/bloc.dart';
import 'package:wom_pocket/src/blocs/suggestions/bloc.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class SuggestionsSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(suggestionNotifierProvider);
    return state.when(data: (data){
      return Container(
        height: 165,
        padding: const EdgeInsets.only(top: 5.0, left: 5.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: data.suggestions.map((s) {
            return GestureDetector(
              onTap: () {},
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Stack(
                  children: <Widget>[
                    Card(
                      color: baseIconColor,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                s.type!.toUpperCase(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[400]),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                s.text!,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey[300],
                        ),
                        onPressed: null,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: IconButton(
                        color: Colors.grey[200],
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.grey[200],
                        ),
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    }, error: (e,s){
      return Center(
        child: Text(
          AppLocalizations.of(context)!.translate('somethings_wrong'),
        ),
      );
    }, loading: (){
      return Container(
        height: 165,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
    if (state is SuggestionsLoaded) {

    }

  }
}
