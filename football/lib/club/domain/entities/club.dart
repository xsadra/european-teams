import 'package:flutter/foundation.dart';
import 'package:sailor/sailor.dart';

class Club with BaseArguments {
  final String id;
  final String name;
  final String country;
  final int value;
  final String image;
  final bool hasImage;
  final int europeanTitles;
  final Stadium stadium;
  final Location location;

  Club({
    @required this.id,
    @required this.name,
    @required this.country,
    @required this.value,
    @required this.image,
    @required this.hasImage,
    @required this.europeanTitles,
    @required this.stadium,
    @required this.location,
  });
}

class Stadium {
  final String name;
  final BigInt size;

  Stadium({
    @required this.name,
    @required this.size,
  });
}

class Location {
  final double lat;
  final double lng;

  Location({
    @required this.lat,
    @required this.lng,
  });
}
