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
                customIcon(),
                SizedBox(width: 5),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      clubName(),
                      clubCountry(),
                      clubValue(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        tileSplitter(),
      ],
    );
  }

  SizedBox tileSplitter() {
    return SizedBox(
      height: 1,
      child: Container(
        color: Colors.black38,
      ),
    );
  }

  Row clubValue() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          club.value.toString() + " Millionen",
          style: TextStyle(color: Colors.black87),
        ),
      ],
    );
  }

  Text clubCountry() {
    return Text(
      club.country,
      style: TextStyle(fontSize: 10.0, color: Colors.black54),
    );
  }

  Text clubName() {
    return Text(
      club.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
        color: Colors.black87,
      ),
    );
  }

  SizedBox customIcon() {
    return SizedBox(
      height: 56.0,
      width: 56.0,
      child: club.hasImage
          ? Image.network(club.image)
          : Icon(Icons.error, color: Colors.black26, size: 48.0),
    );
  }
}
