import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({
    Key key,
    @required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: kStyleMessageDisplay,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
