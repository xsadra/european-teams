import 'package:flutter/material.dart';
import 'package:football/club/domain/entities/club.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      );

  Text _clubCountry() => Text(
        club.country,
        style: const TextStyle(fontSize: 10.0, color: Colors.black54),
      );

  Text _clubName() => Text(
        club.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.black87,
        ),
      );

  SizedBox _customIcon() => SizedBox(
        height: 56.0,
        width: 56.0,
        child: club.hasImage
            ? Image.network(club.image)
            : const Icon(Icons.error, color: Colors.black26, size: 48.0),
      );
}
