import 'package:http/http.dart' as http;
import '../models/ids.dart';
import '../models/stories.dart';

class Services{
  static List<int> ids;
  static Story story;
  static Future<List<int>> getIds() async {
    var response = await http.get('https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty');
    if (response.statusCode == 200) {
      ids = idsFromJson(response.body);
      if (ids == null) {
        return <int>[];
      }  else{
        return ids;
      }
    } else{
      return <int>[];
    }
  }

  static Future<Story> getStory(int id) async {
    var response = await http.get('https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty');
    if (response.statusCode == 200) {
      story = storiesFromJson(response.body);
      if (story == null) {
        return null;
      }  else{
        return story;
      }
    } else{
      return null;
    }
  }
}