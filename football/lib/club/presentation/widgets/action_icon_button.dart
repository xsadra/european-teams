import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/club/presentation/bloc/club/bloc.dart';

class ActionIconButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const ActionIconButton({
    Key key,
    @required this.imagePath,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<ClubBloc, ClubState>(
        buildWhen: (previous, current) => current is SortedBy,
        builder: (context, state) {
          bool ascOrder = false;
          if (state is SortedBy) {
            ascOrder = state.ascOrder;
          }
          return RotatedBox(
            quarterTurns: ascOrder ? 2 : 0,
            child: Image.asset(
              imagePath,
            ),
          );
        },
      ),
      onPressed: onPressed,
    );
  }
}
