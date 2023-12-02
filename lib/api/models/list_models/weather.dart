class Weather {
  late int id;
  late String main;
  late String description;
  late String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  Weather.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    main = map['main'];
    description = map['description'];
    icon = map['icon'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map={
      'id' : this.id,
      'main' : this.main,
      'description' : this.icon,
      'icon' : this.icon,
    };
    return map;
    }
  }
