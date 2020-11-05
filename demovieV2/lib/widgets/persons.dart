import 'package:demovie/bloc/get_persons_bloc.dart';
import 'package:demovie/model/person.dart';
import 'package:demovie/model/person_response.dart';
import 'package:demovie/screens/movie_by_person.dart';
import 'package:flutter/material.dart';
import 'package:demovie/style/theme.dart' as Style;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonList extends StatefulWidget {
  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  void initState() {
    super.initState();
    personsBloc..getPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "TRENDING PERSON ON THIS WEEK",
            style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<PersonResponse>(
            stream: personsBloc.subject.stream,
            builder: (context, AsyncSnapshot<PersonResponse> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return _buildErrorWidget(snapshot.data.error);
                }
                return _buildPersonsWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return _buildErrorWidget(snapshot.error);
              } else {
                return _buildLoadingWidget();
              }
            }),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Error occured: $error")],
      ),
    );
  }

  Widget _buildPersonsWidget(PersonResponse data) {
    List<Person> persons = data.persons;
    return Container(
      height: 130.0,
      padding: EdgeInsets.only(left: 10.0),
      child: ListView.builder(
          itemCount: persons.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 100.0,
              padding: EdgeInsets.only(top: 10.0, right: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieByPerson(
                                personId: persons[index].id,
                              )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    persons[index].profileImg == null
                        ? Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Style.Colors.secondColor),
                            child: Icon(
                              FontAwesomeIcons.userAlt,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w200" +
                                        persons[index].profileImg),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      persons[index].name,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Trending for ${persons[index].known}",
                      style: TextStyle(
                          color: Style.Colors.titleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 7.0),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
