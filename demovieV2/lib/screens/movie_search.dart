import 'package:demovie/bloc/get_movies_bloc.dart';
import 'package:demovie/bloc/get_movies_search_bloc.dart';
import 'package:demovie/model/movie.dart';
import 'package:demovie/model/movie_response.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:demovie/style/theme.dart' as Style;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'detail_screen.dart';

class MovieSearch extends SearchDelegate<MovieResponse> {
  @override
  final String searchFieldLabel = "Search Movie";

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Style.Colors.mainColor,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.white, width: 2.0)),
        hintStyle: TextStyle(
          color: Colors.white38,
          fontFamily: theme.primaryTextTheme.headline6.fontFamily,
        ),
      ),
      textTheme: theme.textTheme.copyWith(
        headline6:
            theme.textTheme.headline6.copyWith(color: Style.Colors.secondColor),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    movieSearchBloc..getMovieSearch(query);
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<MovieResponse>(
              stream: movieSearchBloc.subject.stream,
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<MovieResponse>(
              stream: moviesBloc.subject.stream,
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

  Widget _buildMoviesWidget(BuildContext context, MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return Container(
        child: Text("No Movie"),
      );
    } else
      return Container(
        decoration: BoxDecoration(color: Style.Colors.mainColor),
        height: MediaQuery.of(context).size.height - 80,
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
