class Township {
  final String name;
  final int fee;
  Township({required this.name, required this.fee});

  factory Township.fromJson(Map<String, dynamic> json) => Township(
        name: json["name"] as String,
        fee: json["fee"] as int,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'fee': fee,
      };
}
