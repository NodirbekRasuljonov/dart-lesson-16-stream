// ignore: slash_for_doc_comments

/**
import 'dart:io';

File fayl=File('D:\\flutter_bootcamp\\dart_lesson_16\\bin\\html\\pagenotfound.html');

void main(List<String> args) async {

  Stream<HttpRequest> server;
  try {
    server=await HttpServer.bind("127.0.0.1", 3000);
    
  } catch (e) {
    print("Server ishga tushmadi ");
    exit(-1);
  }

  await for (HttpRequest req in server) {
    if(await fayl.exists()){
      print("Fayl Mavjud");
      req.response.headers.contentType=ContentType.html;
      await req.response.addStream(fayl.openRead());
      await req.response.close();
    }else{
      print("Fayl topilmadi");
    }
    req.response.close();
  }
}
*/

// ignore: slash_for_doc_comments
/** 
// List ni  LIst.generate yordamida Modellar bilan to'ldirish
void main(List<String> args) {
  List<Car> _car=List.generate(10, (i) => Car(model: "Model : $i",speed: i*100));

  _car.forEach((element) {
    print(element.model);
  });
  
  List<String> _carInfo=_car.map((e) => " Model:${e.model}, Speed:${e.speed}").toList();
  _carInfo.forEach((element) {
    print(element);
  });
}


class Car extends Object{
  String? model;
  int? speed;
  Car({required this.model,required this.speed});
}*/


import 'dart:convert';

import "package:http/http.dart" as http;

void main(List<String> args) async {
  Uri url=Uri.parse("https://nbu.uz/en/exchange-rates/json/");
  var kursData=await http.get(url);
// print(kursData.body);
  List finished=jsonDecode(kursData.body);
  String dav1=args[0];
  String dav2=args[1];
  double miq=double.parse(args[2]);
  double fin=0;

  finished.forEach((element) {
    if(element['code']==dav1){
      miq*=double.parse(element['cb_price']);
    }
    if(element['code']==dav2){
      fin=miq/double.parse(element["cb_price"]);
    }
  });
  print(fin);

}