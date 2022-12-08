class Codes {
  final String code;
  final DateTime created;

  Codes({
    required this.code,
    required this.created,
  });

  factory Codes.fromJson(Map<String, dynamic> json) {
    return Codes(
      code: json['code'],
      created: json['created'],
    );
  }
}
