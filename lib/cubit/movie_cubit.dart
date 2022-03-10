import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example1/model/models.dart';
import 'package:example1/services/services.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  Future<void> getMovies(String film) async {
    ApiReturnValue<List<Movie>> result = await MovieServices.getAllMovie(film);

    if (result.value != null) {
      emit(MovieLoaded(result.value));
    } else {
      emit(MovieLoadingFailed(result.message));
    }
  }
}
