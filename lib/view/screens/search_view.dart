import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/model/movie_model.dart';
import 'package:tradexa_assignment/services/movie_api_service.dart';
import 'package:tradexa_assignment/view/screens/movie_detail_view.dart';
import 'package:tradexa_assignment/view/widgets/custom_text.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  MovieModel _movieModel;
  bool _isLoading = false;

  void fetchMovie() async {
    setState(() {
      _isLoading = true;
    });

    var movie = await MovieApiService.getMovies();
    if (movie != null) {
      setState(() {
        _movieModel = movie;
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
                _searchWidget(),
                SizedBox(
                  height: 32,
                ),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: 3,
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
                                      movieModel: _movieModel,
                                    ),
                                  ),
                                );
                              },
                              child: _movieListItem(movieModel: _movieModel),
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

  Padding _searchWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Container(
        height: 48,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryWhite.withOpacity(0.2),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/Frame.png",
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  customText(
                    text: "Avengers: Endgame",
                    fontSize: 18,
                    textColor: primaryWhite.withOpacity(0.8),
                  )
                ],
              ),
              Image.asset(
                "assets/Group 220.png",
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _movieListItem({
    @required MovieModel movieModel,
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
                movieModel.poster,
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
                      width: 4,
                    ),
                    customText(
                        text: "${movieModel.imdbRating} /10",
                        fontSize: 14,
                        textColor: primaryDarkPurple),
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
              text: movieModel.title,
              fontSize: 22,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, top: 8),
          child: Row(
            children: [
              Image.asset(
                "assets/Group 356.png",
                height: 24,
                width: 24,
              ),
              SizedBox(
                width: 10,
              ),
              customText(
                text: movieModel.runtime,
                fontSize: 18,
                textColor: primaryYellow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
