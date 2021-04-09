import 'package:flutter/material.dart';
import 'package:football/club/domain/entities/club.dart';
import 'package:football/club/presentation/widgets/detail_text.dart';
import 'package:football/locale/app_localization.dart';

class ViewClubPage extends StatelessWidget {
  final Club club;

  const ViewClubPage({Key key, this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations msg = AppLocalizations.of(context);

    final String firstMessage = msg.firstMessage
        .replaceFirst('xCountry', club.country)
        .replaceFirst('xValue', club.value.toString());
    final String secondMessage = msg.secondMessage
        .replaceFirst('xVictorious', club.europeanTitles.toString());
    return MaterialApp(
      theme: ThemeData().copyWith(primaryColor: const Color(0xFF01C13B)),
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
              color: const Color(0xFF333333),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 24.0),
                  Expanded(
                    child: club.hasImage
                        ? Image.network(club.image)
                        : const Icon(Icons.error,
                            color: Colors.white70, size: 120.0),
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
                    TextSpan(text: msg.club + ' '),
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
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  TextSpan _clubNameText() {
    return TextSpan(
      text: club.name,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
