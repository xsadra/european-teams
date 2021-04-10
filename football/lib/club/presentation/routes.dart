import 'package:sailor/sailor.dart';

import '../../core/constants/texts.dart';
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
  static const String clubs = PATH_CLUBS;
  static const String viewClub = PATH_VIEW_CLUB;

  RoutePaths._();
}
