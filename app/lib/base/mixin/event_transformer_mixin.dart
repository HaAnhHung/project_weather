import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

mixin EventTransformerMixin {
  EventTransformer<T> log<T>({String? tag}) {
    return (events, mapper) => events.flatMap(mapper);
  }
}
