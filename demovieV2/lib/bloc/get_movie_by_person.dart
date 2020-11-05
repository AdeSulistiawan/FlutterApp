import 'package:demovie/model/movie_response.dart';
import 'package:demovie/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieByPersonListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovieByPersonSearch(int personId) async {
    MovieResponse response = await _repository.getMoviesByPerson(personId);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final movieByPersonBloc = MovieByPersonListBloc();
