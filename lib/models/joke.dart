class Joke {
  int id;
  String type;
  String setup;
  String punchline;
  bool isFavorite = false;

  Joke(
      {required this.id,
      required this.type,
      required this.setup,
      required this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
      id: json["id"],
      type: json["type"],
      setup: json["setup"],
      punchline: json["punchline"]);
}
