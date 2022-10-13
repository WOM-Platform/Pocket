import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/blocs/suggestions/bloc.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class SuggestionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionsBloc, SuggestionsState>(
      builder: (BuildContext context, SuggestionsState state) {
        if (state is SuggestionsLoading) {
          return Container(
            height: 165,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is SuggestionsLoaded) {
          return Container(
            height: 165,
            padding: const EdgeInsets.only(top: 5.0, left: 5.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: state.suggestions.map((s) {
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
        }
        return Center(
          child: Text(
            AppLocalizations.of(context)!.translate('somethings_wrong'),
          ),
        );
      },
    );
  }
}
