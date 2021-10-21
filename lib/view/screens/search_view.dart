import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/model/movies_model.dart';
import 'package:tradexa_assignment/services/movie_api_service.dart';
import 'package:tradexa_assignment/view/screens/movie_detail_view.dart';
import 'package:tradexa_assignment/view/widgets/custom_text.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  MoviesModel _moviesModel;
  bool _isLoading = false;

  void fetchMovie() async {
    setState(() {
      _isLoading = true;
    });

    var movie = await MovieApiService.getMovies();
    if (movie != null) {
      setState(() {
        _moviesModel = movie;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryPurple,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg bloop.png"),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                customText(
                  text: "Most Popular\nMovies",
                  fontSize: 32,
                  textColor: primaryWhite.withOpacity(0.8),
                ),
                SizedBox(
                  height: 32,
                ),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: 10,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 32,
                            );
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailView(
                                      moviesModel: _moviesModel,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              child: _movieListItem(
                                moviesModel: _moviesModel,
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _movieListItem({
    @required MoviesModel moviesModel,
    @required int index,
  }) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              image: NetworkImage(
                "https://image.tmdb.org/t/p/original/${moviesModel.results[index].backdropPath}",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: 80,
                height: 24,
                decoration: BoxDecoration(
                  color: primaryWhite.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Star 1.png",
                      height: 14,
                      width: 14,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    customText(
                      text: "${moviesModel.results[index].voteAverage} /10",
                      fontSize: 14,
                      textColor: primaryDarkPurple,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: customText(
              text: moviesModel.results[index].title,
              fontSize: 22,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        
      ],
    );
  }
}
