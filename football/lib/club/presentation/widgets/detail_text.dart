import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';

class DetailText extends StatelessWidget {
  const DetailText({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<InlineSpan> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll_8,
      child: RichText(
        text: TextSpan(
          style: kStyleDetailText,
          children: children,
        ),
      ),
    );
  }
}
