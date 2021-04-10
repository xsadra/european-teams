import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football/club/domain/entities/club.dart';
import 'package:football/club/domain/repository/club_repository.dart';
import 'package:football/club/domain/usecases/get_clubs.dart';
import 'package:mockito/mockito.dart';

class MockClubRepository extends Mock implements ClubRepository {}

void main() {
  GetClubs useCase;
  MockClubRepository mockClubRepository;

  setUp(() {
    mockClubRepository = MockClubRepository();
    useCase = GetClubs(mockClubRepository);
  });

  final tClubs = <Club>[
    Club(
      id: "10000000-0000-0000-0000-000000000000",
      name: "team name",
      country: "country name",
      value: 1000,
      image: "https://link.com/img.png",
      hasImage: true,
      europeanTitles: 1,
      location: Location(lat: 10.0001, lng: 11.0001),
      stadium: Stadium(name: 'stadium', size: 100000),
    )
  ];
  group('GetClubs', () {
    test(
      'should get list of clubs from the repository',
      () async {
        // arrange
        when(mockClubRepository.getClubs())
            .thenAnswer((_) async => Right(tClubs));
        // act
        final result = await useCase();
        // assert
        expect(result, Right(tClubs));
        verify(mockClubRepository.getClubs());
        verifyNoMoreInteractions(mockClubRepository);
      },
    );
  });
}
