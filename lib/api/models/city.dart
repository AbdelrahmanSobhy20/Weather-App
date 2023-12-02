import 'package:weather_project/api/models/city_models/coord.dart';

class City {
  late int id;
  late String name;
  late Coord coord;
  late String country;
  late int population;
  late int timezone;
  late int sunrise;
  late int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });
  City.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    coord = Coord.fromMap(map['coord']);
    country = map['country'];
    population = map['population'];
    timezone = map['timezone'];
    sunrise = map['sunrise'];
    sunset = map['sunset'];
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> map={};
    map['id'] = id;
    map['name'] = name;
    map['coord'] =coord.toMap();
    map['country'] =country;
    map['population'] =population;
    map['timezone'] =timezone;
    map['sunrise'] =sunrise;
    map['sunset'] =sunset;
    return map;
}
}
