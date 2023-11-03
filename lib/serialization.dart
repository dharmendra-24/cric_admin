class User {
  Team team1;
  Team team2;
  String date;
  String tournamentOrganisingBody;
  String tossWinner;
  String statement;
  String? time;

  User({
    required this.date,
    this.tournamentOrganisingBody = "ICC Cricket World Cup 2023",
    this.time,
    required this.team1,
    required this.team2,
    required this.tossWinner,
    this.statement = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      date: json['date'] as String,
      tournamentOrganisingBody: json['tournamentOrganisingBody'] as String,
      time: json['time'] as String,
      team1: Team.fromJson(json['team1']),
      team2: Team.fromJson(json['team2']),
      tossWinner: json['tossWinner'] as String,
      statement: json['statement'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'tournamentOrganisingBody': tournamentOrganisingBody,
      'time': time,
      'team1': team1.toJson(),
      'team2': team2.toJson(),
      'tossWinner': tossWinner,
      'statement': statement,
    };
  }
}

class Team {
  String name;
  int score;
  int over;
  int outPlayers;
  String url;

  Team({
    this.name = "",
    this.score = 0,
    this.over = 0,
    this.outPlayers = 0,
    this.url = "../../assets/images/sri-lanka.jpg",
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'] as String,
      score: json['score'] as int,
      over: json['over'] as int,
      outPlayers: json['outPlayers'] as int,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'score': score,
      'over': over,
      'outPlayers': outPlayers,
      'url': url,
    };
  }
}
