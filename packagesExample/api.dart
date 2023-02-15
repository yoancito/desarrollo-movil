//fetch pokemon data from pokeapi
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  String host = "pokeapi.co";
  String path = "/api/v2/pokemon/";

  List<Pokemon> pokemons = [];

  getPokemon(host, path).then((value) {
    String pokemon = value.body;
    var source = jsonDecode(pokemon);
    for(var element in source['results']){
      pokemons.add(Pokemon.fromJson(element));
    }
    print(pokemons);
    });
}

Future<http.Response> getPokemon(String host, String path) async {
  Uri url = Uri.https(host, path);
  var response = await http.get(url);
  return response;
}

class Pokemon{
  late String name;
  late String url;
  Pokemon.fromJson(Map<String, dynamic> json){
    this.name = json['name'];
    this.url = json['url'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Nombre: $name, url: $url";
  }
}