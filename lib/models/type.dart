class JokeType {
  String jokeType;

  JokeType({required this.jokeType});

  factory JokeType.fromJson(String json) => JokeType(jokeType: json);
}
