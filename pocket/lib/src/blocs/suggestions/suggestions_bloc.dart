import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pocket/src/models/suggestion_model.dart';
import './bloc.dart';

class SuggestionsBloc extends Bloc<SuggestionsEvent, SuggestionsState> {
  SuggestionsBloc() {
    dispatch(LoadSuggestions());
  }

  @override
  SuggestionsState get initialState => InitialSuggestionsState();

  @override
  Stream<SuggestionsState> mapEventToState(
    SuggestionsEvent event,
  ) async* {
    if (event is LoadSuggestions) {
      yield SuggestionsLoading();
      await Future.delayed(Duration(milliseconds: 500));
      yield SuggestionsLoaded(suggestionsItem);
    }
  }
}

List<SuggestionModel> suggestionsItem = [
  SuggestionModel(
    text: "What is the WOM?",
    url: "",
    type: "FAQ",
  ),
  SuggestionModel(
    text: "Try catch more woms with SRS",
    url: "",
    type: "Suggestion",
  ),
];
