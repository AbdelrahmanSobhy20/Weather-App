class Wind{
  late double speed;
  late int deg;
  late double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
});

  Wind.fromMap(Map<String,dynamic> map){
    speed = double.parse(map['speed'].toString());
    deg = int.parse(map['deg'].toString());
    gust = double.parse(map['gust'].toString());
  }
  Map<String,dynamic> toMap(){
    return {
    'speed' :speed,
    'deg' : deg,
    'gust' : gust,
    };
  }
}