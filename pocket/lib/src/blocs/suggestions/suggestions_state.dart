import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pocket/src/models/suggestion_model.dart';

@immutable
abstract class SuggestionsState extends Equatable {
  SuggestionsState([List props = const []]) : super(props);
}

class InitialSuggestionsState extends SuggestionsState {}
class SuggestionsLoading extends SuggestionsState {
  @override
  String toString() => "SuggestionsLoading";
}

class SuggestionsLoaded extends SuggestionsState {
  final List<SuggestionModel> suggestions;

  SuggestionsLoaded(this.suggestions) : super([suggestions]);

  @override
  String toString() => "SuggestionsLoaded";
}
