import 'package:sailor/sailor.dart';

import 'pages/pages.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: RoutePaths.clubs,
        builder: (context, _, __) {
          return ClubsPage();
        },
      ),
      SailorRoute(
          name: RoutePaths.viewClub,
          builder: (context, club, _) => ViewClubPage(club: club)),
    ]);
  }
}

class RoutePaths {
  static const String clubs = '/clubs';
  static const String viewClub = '/view_club';

  RoutePaths._();
}
