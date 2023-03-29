// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.response,
  });

  Response response;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
  };
}

class Response {
  Response({
    required this.rollupDate,
    required this.ranks,
  });

  int rollupDate;
  List<Rank> ranks;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    rollupDate: json["rollup_date"],
    ranks: List<Rank>.from(json["ranks"].map((x) => Rank.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rollup_date": rollupDate,
    "ranks": List<dynamic>.from(ranks.map((x) => x.toJson())),
  };
}

class Rank {
  Rank({
    required this.rank,
    required this.appid,
    required this.lastWeekRank,
    required this.peakInGame,
  });

  int rank;
  int appid;
  int lastWeekRank;
  int peakInGame;

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
    rank: json["rank"],
    appid: json["appid"],
    lastWeekRank: json["last_week_rank"],
    peakInGame: json["peak_in_game"],
  );

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "appid": appid,
    "last_week_rank": lastWeekRank,
    "peak_in_game": peakInGame,
  };
}
