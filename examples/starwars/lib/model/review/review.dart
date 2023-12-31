import 'package:flutter/material.dart';

import 'package:starwars_app/model/episode/episode.dart';

class Review {
  Review({
    @required this.episode,
    @required this.stars,
    @required this.id,
    this.commentary,
  });

  String id;
  Episode episode;
  int stars;
  String commentary;

  Review copyWith({
    Episode episode,
    int stars,
    String commentary,
  }) {
    return Review(
      id: id,
      episode: episode ?? this.episode,
      stars: stars ?? this.stars,
      commentary: commentary ?? this.commentary,
    );
  }

  Map<String, dynamic> toJson() {
    assert(episode != null && stars != null);

    return <String, dynamic>{
      'episode': episodeToJson(episode),
      'stars': stars,
      'commentary': commentary,
    };
  }

  static Review fromJson(Map<String, dynamic> map) => Review(
        id: map['id'],
        episode: episodeFromJson(map['episode'] as String),
        stars: map['stars'] as int,
        commentary: map['commentary'] as String,
      );
}

const String Function(Object jsonObject) displayReview = getPrettyJSONString;
