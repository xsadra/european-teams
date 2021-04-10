import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:football/club/data/models/club_model.dart';
import 'package:football/club/domain/entities/club.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tStadiumModel = StadiumModel(name: 'stadium', size: 100000);
  final tLocationModel = LocationModel(lat: 10.0001, lng: 11.0001);
  final tClubModel = ClubModel(
    id: "10000000-0000-0000-0000-000000000000",
    name: "team name",
    country: "country name",
    value: 1000,
    image: "https://link.com/img.png",
    hasImage: true,
    europeanTitles: 1,
    location: tLocationModel,
    stadium: tStadiumModel,
  );

  test(
    'should be a subClass of Club entity',
    () async {
      // assert
      expect(tClubModel, isA<Club>());
    },
  );

  group('StadiumModel', () {
    test(
      'should be a subClass of Stadium entry',
      () async {
        // assert
        expect(tStadiumModel, isA<Stadium>());
      },
    );

    group('fromJson', () {
      test(
        'should return a valid model of Stadium',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('stadium.json'));
          // act
          final result = StadiumModel.fromJson(jsonMap);
          // assert
          expect(result, tStadiumModel);
        },
      );
    });

    group('objToJson', () {
      test(
        'should return a Json containing the proper Data',
        () async {
          // act
          final result = StadiumModel.objToJson(tStadiumModel);
          // assert
          final matcherMap = {
            "size": 100000,
            "name": "stadium",
          };
          expect(result, matcherMap);
        },
      );
    });
    group('toJson', () {
      test(
        'should return a Json containing the proper Data',
        () async {
          // act
          final result = tStadiumModel.toJson();
          // assert
          final matcherMap = {
            "size": 100000,
            "name": "stadium",
          };
          expect(result, matcherMap);
        },
      );
    });
  });

  group('LocationModel', () {
    test(
      'should be a subClass of Location entry',
      () async {
        // assert
        expect(tLocationModel, isA<Location>());
      },
    );

    group('fromJson', () {
      test(
        'should return a valid model of Location',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('location.json'));
          // act
          final result = LocationModel.fromJson(jsonMap);
          // assert
          expect(result, tLocationModel);
        },
      );
    });

    group('objToJson', () {
      test(
        'should return a Json containing the proper Data',
        () async {
          // act
          final result = LocationModel.objToJson(tLocationModel);
          // assert
          final matcherMap = {
            "lat": 10.0001,
            "lng": 11.0001,
          };
          expect(result, matcherMap);
        },
      );
    });
    group('toJson', () {
      test(
        'should return a Json containing the proper Data',
        () async {
          // act
          final result = tLocationModel.toJson();
          // assert
          final matcherMap = {
            "lat": 10.0001,
            "lng": 11.0001,
          };
          expect(result, matcherMap);
        },
      );
    });
  });

  group('ClubModel', () {
    test(
      'should be a subClass of Club entry',
      () async {
        // assert
        expect(tClubModel, isA<Club>());
      },
    );

    group('fromJson', () {
      test(
        'should return a valid model of Club',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('club.json'));
          // act
          final result = ClubModel.fromJson(jsonMap);
          // assert
          expect(result, tClubModel);
        },
      );
    });

    group('toJson', () {
      test(
        'should return a Json containing the proper Data',
        () async {
          // act
          final result = tClubModel.toJson();
          // assert
          final matcherMap = {
            "id": "10000000-0000-0000-0000-000000000000",
            "name": "team name",
            "country": "country name",
            "value": 1000,
            "image": "https://link.com/img.png",
            "european_titles": 1,
            "stadium": {"size": 100000, "name": "stadium"},
            "location": {"lat": 10.0001, "lng": 11.0001},
          };
          expect(result, matcherMap);
        },
      );
    });
    group('fromJsonList', () {
      test(
        ' should return a valid list of club model',
        () async {
          // act
          final jsonMap = fixture('clubs.json');
          final result = ClubModel.fromJsonList(jsonMap);
          // assert
          expect(result.length, 2);
          expect(result.first, tClubModel);
        },
      );
    });
  });
}
