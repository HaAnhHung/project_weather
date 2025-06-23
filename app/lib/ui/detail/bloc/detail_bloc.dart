import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'detail_event.dart';
import 'detail_state.dart';

@Injectable()
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetCurrentWeather getCurrentWeather;

  DetailBloc({required this.getCurrentWeather})
    : super(const DetailState.initial()) {
    on<DetailShow>((event, emit) async {
      emit(const DetailState.loading());
      try {
        final input = GetWeatherInput(city: event.city);
        final output = await getCurrentWeather.execute(input);
        emit(DetailState.loaded(detail: output.weather));
      } catch (error) {
        emit(DetailState.error(message: error.toString()));
      }
    });
  }
}
