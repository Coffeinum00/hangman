class LeaderboardModel {
  LeaderboardModel(
      {required this.login, required this.score, required this.time});

  LeaderboardModel.fromJson(Map<String, dynamic> json)
      : this(
          login: json['login']! as String,
          score: json['score']! as int,
          time: json['time']! as int,
        );

  String? login;
  int? score;
  int? time;

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'score': score,
      'time': time,
    };
  }
}
