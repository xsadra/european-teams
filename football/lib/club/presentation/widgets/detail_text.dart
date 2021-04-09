import 'package:flutter/material.dart';

class DetailText extends StatelessWidget {
  const DetailText({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<InlineSpan> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
          ),
          children: children,
        ),
      ),
    );
  }
}
