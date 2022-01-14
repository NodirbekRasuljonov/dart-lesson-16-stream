import 'class.dart';
import "package:http/http.dart" as http;
import 'dart:convert';


void main(List<String> args) {
  getjson().then((value) => value.forEach((element) {
    print("Lat:${element.address!.geo!.lat}");
  }));



}



Future<List<User>> getjson() async{
  Uri url=Uri.parse("https://jsonplaceholder.typicode.com/users");
  var data=await http.get(url);
  List<User> datapost=(jsonDecode(data.body) as List).map((e) => User.fromJson(e)).toList();
  return datapost;
}