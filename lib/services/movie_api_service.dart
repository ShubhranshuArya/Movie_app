import 'package:http/http.dart' as http;
import 'package:tradexa_assignment/model/movie_model.dart';

class MovieApiService {
  static Future<MovieModel> getMovies() async {
    var request = http.Request('GET',
        Uri.parse("http://www.omdbapi.com/?i=tt3896198&apikey=4503e1cb"));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      
      return movieModelFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return MovieModel();
    }
  }
}
