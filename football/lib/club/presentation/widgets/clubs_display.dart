import 'package:flutter/material.dart';

import '../../../club/domain/entities/club.dart';
import '../../presentation/bloc/club/bloc.dart';
import '../routes.dart';
import 'custom_list_tile.dart';

class ClubsDisplay extends StatelessWidget {
  final Loaded state;

  ClubsDisplay({
    this.state,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.clubs.length,
      itemBuilder: (context, index) {
        Club club = state.clubs.elementAt(index);
        return CustomListTile(
          club: club,
          onTap: () async => _navigateToViewClubPage(context, club),
        );
      },
    );
  }
}

void _navigateToViewClubPage(BuildContext context, Club club) =>
    Routes.sailor.navigate(RoutePaths.viewClub, args: club);
