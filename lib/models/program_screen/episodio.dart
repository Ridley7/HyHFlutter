class Episodio {
  String text;

  Episodio({required this.text});

  factory Episodio.fromJson(Map<String, dynamic> json) {
    return Episodio(
      text: json["text"],
    );
  }
}