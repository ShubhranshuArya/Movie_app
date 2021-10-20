import 'package:flutter/material.dart';
import 'package:tradexa_assignment/helper/constants/color_constants.dart';
import 'package:tradexa_assignment/model/movie_model.dart';
import 'package:tradexa_assignment/view/widgets/custom_image_button.dart';
import 'package:tradexa_assignment/view/widgets/image_container_detailScreen.dart';
import 'package:tradexa_assignment/view/widgets/second_container.dart';
import 'package:tradexa_assignment/view/widgets/third_container.dart';

import '../widgets/first_container.dart';

class MovieDetailView extends StatelessWidget {
  final MovieModel movieModel;

  const MovieDetailView({
    @required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              imageContainerWidget(
                title: movieModel.title,
                genre: movieModel.genre,
                poster: movieModel.poster,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomImageButton(
                    contSize: 64,
                    image: "assets/Vector 27.png",
                    opacity: 0.1,
                    imgSize: 24,
                    bgColor: primaryPurple,
                  ),
                  CustomImageButton(
                    contSize: 64,
                    image: "assets/Path-1.png",
                    opacity: 0.1,
                    imgSize: 24,
                    bgColor: primaryPurple,
                  ),
                  CustomImageButton(
                    contSize: 64,
                    image: "assets/Path.png",
                    opacity: 0.1,
                    imgSize: 24,
                    bgColor: primaryPurple,
                  ),
                ],
              ),
              SizedBox(height: 32),
              FirstContainer(
                imdbRating: movieModel.imdbRating,
                rottenTomatoes: movieModel.ratings[1].value,
                metaCritic: movieModel.ratings[2].value,
              ),
              SizedBox(height: 32),
              SecondContainer(
                released: movieModel.year,
                country: movieModel.country,
                runtime: movieModel.runtime,
                language: movieModel.language,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: ThirdContainer(
                  plot: movieModel.plot,
                  actors: movieModel.actors,
                  directors: movieModel.director,
                  writers: movieModel.writer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
