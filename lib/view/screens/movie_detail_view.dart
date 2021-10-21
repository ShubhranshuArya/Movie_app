import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/model/movies_model.dart';
import 'package:tradexa_assignment/view/widgets/custom_image_button.dart';
import 'package:tradexa_assignment/view/widgets/image_container_detailScreen.dart';
import 'package:tradexa_assignment/view/widgets/second_container.dart';
import 'package:tradexa_assignment/view/widgets/third_container.dart';

import '../widgets/first_container.dart';

class MovieDetailView extends StatelessWidget {
  final MoviesModel moviesModel;
  final int index;

  const MovieDetailView({
    @required this.moviesModel,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageContainerWidget(
                title: moviesModel.results[index].title,
                poster:
                    "https://image.tmdb.org/t/p/original/${moviesModel.results[index].posterPath}",
              ),
              SizedBox(height: 32),
              FirstContainer(
                imdbRating: moviesModel.results[index].voteAverage.toString(),
                popularity: moviesModel.results[index].popularity.toString(),
                voteCount: moviesModel.results[index].voteCount.toString(),
              ),
              SizedBox(height: 32),
              ThirdContainer(plot: moviesModel.results[index].overview,),
            ],
          ),
        ),
      ),
    );
  }
}
