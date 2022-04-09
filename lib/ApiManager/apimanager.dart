import 'package:demo_arq/model/actor_model.dart';
import 'package:http/http.dart' as http;



class ApiManager {

  // SINGLETON DART
  ApiManager._private();
  static final _instance = ApiManager._private();
  factory ApiManager() => _instance;
  // ------
  

  //--- properties ---
  String urlBase = "https://www.breakingbadapi.com";

  //-- Methods ---
  Future<ActorModel?> fetchActorFromApiById(String id) async{
    
    String endpoint = urlBase + "/api/characters/$id";
    Uri uri = Uri.parse(endpoint);

    try {

      final resp = await http.get(uri);
      final result = actorModelFromJson(resp.body).first;
      return result;

    } catch (e) {
      return null;
    }

  }
  

}

