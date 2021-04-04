import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:football/club/domain/entities/club.dart';

class ClubModel extends Club {
  final String id;
  final String name;
  final String country;
  final int value;
  final String image;
  final bool hasImage;
  final int europeanTitles;
  final StadiumModel stadium;
  final LocationModel location;

  ClubModel({
    @required this.id,
    @required this.name,
    @required this.country,
    @required this.value,
    @required this.image,
    @required this.hasImage,
    @required this.europeanTitles,
    @required this.stadium,
    @required this.location,
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
      hasImage: json['hasImage'] as bool,
      europeanTitles: (json['europeanTitles'] as num).toInt(),
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
      'stadium': stadium.toJson(),
      'location': location.toJson(),
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
  final double lat;
  final double lng;

  LocationModel({
    @required this.lat,
    @required this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return new LocationModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
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
  final String name;
  final BigInt size;

  StadiumModel({
    @required this.name,
    @required this.size,
  });

  factory StadiumModel.fromJson(Map<String, dynamic> json) {
    return new StadiumModel(
      name: json['name'] as String,
      size: json['size'] as BigInt,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'size': this.size,
    } as Map<String, dynamic>;
  }
}
