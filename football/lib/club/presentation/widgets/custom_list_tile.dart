import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';
import '../../domain/entities/club.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key key,
    @required this.club,
    @required this.onTap,
  }) : super(key: key);

  final Club club;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onTap,
          child: Padding(
            padding: kPaddingVertical_8,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _customIcon(),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _clubName(),
                      _clubCountry(),
                      _clubValue(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        _tileSplitter(),
      ],
    );
  }

  SizedBox _tileSplitter() => SizedBox(
        height: 1,
        child: Container(
          color: Colors.black38,
        ),
      );

  Row _clubValue() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            club.value.toString() + " Millionen",
            style: kStyleClubValue,
          ),
        ],
      );

  Text _clubCountry() => Text(
        club.country,
        style: kStyleClubCountry,
      );

  Text _clubName() => Text(
        club.name,
        style: kStyleClubName,
      );

  SizedBox _customIcon() {
    const errorIcon =
        const Icon(Icons.error, color: Colors.black26, size: 48.0);
    return SizedBox(
      height: 56.0,
      width: 56.0,
      child: club.hasImage ? Image.network(club.image) : errorIcon,
    );
  }
}
