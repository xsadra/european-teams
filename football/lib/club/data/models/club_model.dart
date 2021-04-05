import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:football/club/domain/entities/club.dart';

class ClubModel extends Club {
  ClubModel({
    @required String id,
    @required String name,
    @required String country,
    @required int value,
    @required String image,
    @required bool hasImage,
    @required int europeanTitles,
    @required LocationModel location,
    @required StadiumModel stadium,
  }) : super(
          name: name,
          id: id,
          country: country,
          value: value,
          image: image,
          hasImage: hasImage,
          europeanTitles: europeanTitles,
          stadium: stadium,
          location: location,
        );

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return new ClubModel(
      id: json['id'] as String,
      name: json['name'] as String,
      country: json['country'] as String,
      value: (json['value'] as num).toInt(),
      image: json['image'] as String,
      hasImage: (json['image'] as String).length > 0,
      europeanTitles: (json['european_titles'] as num).toInt(),
      stadium: StadiumModel.fromJson(json['stadium']),
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'country': this.country,
      'value': this.value,
      'image': this.image,
      'hasImage': this.hasImage,
      'europeanTitles': this.europeanTitles,
      'stadium': StadiumModel.objToJson(stadium),
      'location': LocationModel.objToJson(location),
    } as Map<String, dynamic>;
  }

  static List<ClubModel> fromJsonList(dynamic jsonList) {
    Iterable list = json.decode(jsonList);
    return List<ClubModel>.from(
      list.map(
        (model) => ClubModel.fromJson(model),
      ),
    );
  }
}

class LocationModel extends Location {
  LocationModel({
    @required double lat,
    @required double lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return new LocationModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  static Map<String, dynamic> objToJson(Location location) {
    // ignore: unnecessary_cast
    return {
      'lat': location.lat,
      'lng': location.lng,
    } as Map<String, dynamic>;
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'lat': this.lat,
      'lng': this.lng,
    } as Map<String, dynamic>;
  }
}

class StadiumModel extends Stadium {
  StadiumModel({
    @required String name,
    @required BigInt size,
  });

  factory StadiumModel.fromJson(Map<String, dynamic> json) {
    return new StadiumModel(
      name: json['name'] as String,
      size: BigInt.from(json['size']),
    );
  }

  static Map<String, dynamic> objToJson(Stadium stadium) {
    // ignore: unnecessary_cast
    return {
      'name': stadium.name,
      'size': stadium.size,
    } as Map<String, dynamic>;
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'size': this.size,
    } as Map<String, dynamic>;
  }
}
