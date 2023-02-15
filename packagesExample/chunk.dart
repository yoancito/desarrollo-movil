//fetch chunknorr data from chunknorr api
//https://api.chucknorris.io/jokes/random

import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> args) async {
  String host = "api.chucknorris.io";
  String path = "/jokes/random";
  List<Chuck> jokes = [];
  List<String> temp = [];
  int i = 0;

  while (i < 5) {
    await getChuck(host, path).then((data) {
    String joke = data.body;
    var source = jsonDecode(joke);
    jokes.add(Chuck.fromJson(source));
    });
  i++;
  }
  
  jokes.forEach((element) {print('# $element \n');});
}

Future<String> printChuck(List arr) async {
  String result = "1";
  for (var element in arr) {
    result += element.toString();
  }
  return result;
}

Future<http.Response> getChuck(String host, String path) async {
  Uri url = Uri.https(host, path);
  var response = await http.get(url);
  return response;
}

class Chuck{
  late String created_at;
  late String icon_url;
  late String id;
  late String updated_at;
  late String url;
  late String value;

  Chuck.fromJson(Map<String, dynamic> json){
    this.created_at = json['created_at'];
    this.icon_url = json['icon_url'];
    this.id = json['id'];
    this.updated_at = json['updated_at'];
    this.url = json['url'];
    this.value = json['value'];
  }

  @override
  String toString() {
    return (
      'created_at: $created_at \n icon_url: $icon_url \n id: $id \n updated_at: $updated_at \n url: $url \n value: $value'
      );
  }
}