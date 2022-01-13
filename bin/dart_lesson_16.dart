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
}