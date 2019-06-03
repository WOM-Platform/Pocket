import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SuggestionsEvent extends Equatable {
  SuggestionsEvent([List props = const []]) : super(props);
}


class LoadSuggestions extends SuggestionsEvent {
  @override
  String toString() => "LoadSuggestions";
}
