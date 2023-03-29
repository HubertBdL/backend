import 'package:backendfinal/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {

  Future<List<Post>?> getPosts() async {

    var client = http.Client();

    var uri = Uri.parse('https://api.steampowered.com/ISteamChartsService/GetMostPlayedGames/v1/?');
    var response = await client.get(uri);
    if(response.statusCode == 200)
      {
        var json = response.body;
        return getPosts();
      }
  }
}