class SYS {
  late String pod;
  SYS({required this.pod});
  SYS.fromMap(Map<String, dynamic> map) {
    pod = map['pod'];
  }
  Map<String, dynamic> toMap() {
    return {'pod': pod};
  }
}
