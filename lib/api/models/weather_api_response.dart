import 'package:weather_project/api/models/city.dart';

import 'list_details.dart';

class WeatherApiResponse{
  late String cod;
  late int message;
  late int cnt;
  late List<ListDetails> list;
  late City city;

  WeatherApiResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });
  WeatherApiResponse.fromMap(Map<String,dynamic> map){
    cod = map['cod'];
    //print("--------1");
    message= map['message'];
    //print("--------2");
    cnt= map['cnt'];
    //print("--------3");
    list= [];
    (map['list'] as List).forEach((element) {
      list.add(ListDetails.fromMap(element));
    });
    //print("--------4");
    city= City.fromMap(map['city']);
    //print("--------5");
  }
  Map<String,dynamic>toMap(){
    Map <String,dynamic> map={};
    List <Map> tmplist=[];
    list.forEach((element) {
      tmplist.add(element.toMap());
    });
    map['cod'] = cod;
    map['message'] = message;
    map['cnt'] = cnt;
    map['list'] = tmplist;
    map['city'] = city.toMap();
    return map;
  }
}