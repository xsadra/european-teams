import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/constants/texts.dart';
import '../../../locale/app_localization.dart';
import '../../domain/entities/club.dart';
import '../widgets/detail_text.dart';

class ViewClubPage extends StatelessWidget {
  final Club club;

  const ViewClubPage({Key key, this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations msg = AppLocalizations.of(context);

    final String firstMessage = msg.firstMessage
        .replaceFirst(kReplaceCountry, club.country)
        .replaceFirst(kReplaceValue, club.value.toString());
    final String secondMessage = msg.secondMessage
        .replaceFirst(kReplaceVictorious, club.europeanTitles.toString());
    const errorIcon =
        const Icon(Icons.error, color: Colors.white70, size: 120.0);
    return MaterialApp(
      theme: ThemeData().copyWith(primaryColor: kColorMain),
      home: Scaffold(
        appBar: AppBar(
          title: Text(club.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.0,
              color: kColorViewClubPageIconBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 24.0),
                  Expanded(
                    child:
                        club.hasImage ? Image.network(club.image) : errorIcon,
                  ),
                  _clubCountryText(club.country)
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailText(
                  children: <TextSpan>[
                    TextSpan(text: msg.club + SPACE),
                    _clubNameText(),
                    TextSpan(
                      text: firstMessage,
                    )
                  ],
                ),
                DetailText(
                  children: <TextSpan>[
                    _clubNameText(),
                    TextSpan(
                      text: secondMessage,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row _clubCountryText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Text(
            text,
            style: kStyleClubCountryText,
          ),
        )
      ],
    );
  }

  TextSpan _clubNameText() {
    return TextSpan(
      text: club.name,
      style: kStyleClubNameText,
    );
  }
}
