class Main {
  late double temp;
  late double feels_like;
  late double temp_min;
  late double temp_max;
  late int pressure;
  late int sea_level;
  late int grnd_level;
  late int humidity;
  late double temp_kf;

  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.sea_level,
    required this.grnd_level,
    required this.humidity,
    required this.temp_kf,
  });
  Main.fromMap(Map<String, dynamic> map) {
    temp =        double.parse(map['temp'].toString());
    feels_like =  double.parse(map['feels_like'].toString());
    temp_min =    double.parse(map['temp_min'].toString());
    temp_max =    double.parse(map['temp_max'].toString());
    pressure =    int.parse(map['pressure'].toString());
    sea_level =   int.parse(map['sea_level'].toString());
    grnd_level =  int.parse(map['grnd_level'].toString());
    humidity =    int.parse(map['humidity'].toString());
    temp_kf =    double.parse(map['temp_kf'].toString());
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['temp'] = temp;
    map['feels_like'] = feels_like;
    map['temp_min'] = temp_min;
    map['temp_max'] = temp_max;
    map['pressure'] = pressure;
    map['sea_level'] = sea_level;
    map['grnd_level'] = grnd_level;
    map['humidity'] = humidity;
    map['temp_kf'] = temp_kf;
    return map;
  }
}
