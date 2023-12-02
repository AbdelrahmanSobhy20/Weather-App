class Coord{
  late double lat;
  late double lon;

  Coord({
    required this.lat,
    required this.lon,
});
  Coord.fromMap(Map<String , dynamic>map){
    lat = map['lat'];
    lon = map['lon'];
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {};
    map['lat']= lat;
    map['lon']= lon;
    return map;
  }
}