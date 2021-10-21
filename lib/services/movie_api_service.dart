import 'package:http/http.dart' as http;
import 'package:tradexa_assignment/model/movies_model.dart';

class MovieApiService {
  static Future<MoviesModel> getMovies() async {
    var request = http.Request('GET',
        Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=e702a470ed9c3166a4db66cc6a963576&language=en-US"));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      
      return moviesModelFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return MoviesModel();
    }
  }
}
