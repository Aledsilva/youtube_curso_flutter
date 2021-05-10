import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyCeRbj6NwOxJK-u5yUMRpkfIESDxqFyfjg";
const ID_CANAL = "UCd-SaOVhWeJow5zS37C4b2A";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response response = await http.get(
        URL_BASE + "search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$CHAVE_YOUTUBE_API"
        "&channelId=$ID_CANAL" //se retirar vamos usar o youtube inteiro, e nao um canal especifico
        "&q=$pesquisa"
    );
    if( response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            ///return Video.converterJson(map);
          }
      ).toList();

      return videos;

      for(var video in dadosJson["items"]){
        print("Resultado: " + video.toString());

      }
      //print("resultado: " + dadosJson["items"][3]["snippet"]["title"].toString());

    }else{

    }
  }
}