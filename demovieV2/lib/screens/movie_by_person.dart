import 'package:demovie/bloc/get_movie_by_person.dart';
import 'package:demovie/bloc/get_persons_by_id_bloc.dart';
import 'package:demovie/model/movie.dart';
import 'package:demovie/model/movie_response.dart';
import 'package:demovie/model/person.dart';
import 'package:demovie/model/person_response.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:demovie/style/theme.dart' as Style;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'detail_screen.dart';

class MovieByPerson extends StatefulWidget {
  final int personId;
  const MovieByPerson({Key key, this.personId}) : super(key: key);

  @override
  _MovieByPersonState createState() => _MovieByPersonState(personId);
}

class _MovieByPersonState extends State<MovieByPerson> {
  final int personId;

  _MovieByPersonState(this.personId);

  @override
  void initState() {
    super.initState();
    movieByPersonBloc..getMovieByPersonSearch(personId);
    personsByIdBloc..getPersonById(personId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(EvaIcons.arrowBack, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("De Movie App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<SinglePersonResponse>(
                stream: personsByIdBloc.subject.stream,
                builder:
                    (context, AsyncSnapshot<SinglePersonResponse> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.error != null &&
                        snapshot.data.error.length > 0) {
                      return _buildErrorWidget(snapshot.data.error);
                    }
                    return _buildPersonWidget(context, snapshot.data);
                  } else if (snapshot.hasError) {
                    return _buildErrorWidget(snapshot.error);
                  } else {
                    return _buildLoadingWidget();
                  }
                }),
            StreamBuilder<MovieResponse>(
                stream: movieByPersonBloc.subject.stream,
                builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.error != null &&
                        snapshot.data.error.length > 0) {
                      return _buildErrorWidget(snapshot.data.error);
                    }
                    return _buildMoviesWidget(context, snapshot.data);
                  } else if (snapshot.hasError) {
                    return _buildErrorWidget(snapshot.error);
                  } else {
                    return _buildLoadingWidget();
                  }
                }),
          ],
        ),
      ),
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

  Widget _buildPersonWidget(BuildContext context, SinglePersonResponse data) {
    Person person = data.person;
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Style.Colors.mainColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w200" + person.profileImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name,
                    style: TextStyle(
                      color: Style.Colors.secondColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        person.gender == 1 ? "Female" : "Male",
                        style: TextStyle(
                          color: Style.Colors.secondColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        Icons.cake,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      Text(
                        person.birthday,
                        style: TextStyle(
                          color: Style.Colors.secondColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    person.biography,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMoviesWidget(BuildContext context, MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return Container(
        child: Text("No Movie"),
      );
    } else
      return Container(
        decoration: BoxDecoration(color: Style.Colors.mainColor),
        height: MediaQuery.of(context).size.height - 100,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(movie: movies[index])));
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      movies[index].poster == null
                          ? Container(
                              width: 120.0,
                              height: 180.0,
                              decoration: BoxDecoration(
                                  color: Style.Colors.secondColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0)),
                                  shape: BoxShape.rectangle),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    EvaIcons.filmOutline,
                                    color: Colors.white,
                                    size: 50.0,
                                  )
                                ],
                              ),
                            )
                          : Container(
                              width: 120.0,
                              height: 180.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w200" +
                                            movies[index].poster),
                                    fit: BoxFit.cover),
                              ),
                            ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width) - 150,
                            child: Text(
                              movies[index].title,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                movies[index].rating.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              RatingBar(
                                  itemSize: 10.0,
                                  initialRating: movies[index].rating / 2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                        EvaIcons.star,
                                        color: Style.Colors.secondColor,
                                      ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width) - 150,
                            child: Text(movies[index].overview,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    height: 1.5)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
  }
}
