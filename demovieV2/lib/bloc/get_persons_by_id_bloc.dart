import 'package:demovie/model/person_response.dart';
import 'package:demovie/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonsByIdListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<SinglePersonResponse> _subject =
      BehaviorSubject<SinglePersonResponse>();

  getPersonById(int id) async {
    SinglePersonResponse response = await _repository.getPersonById(id);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<SinglePersonResponse> get subject => _subject;
}

final personsByIdBloc = PersonsByIdListBloc();
