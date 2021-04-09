import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/club/presentation/bloc/club/bloc.dart';
import 'package:football/club/presentation/widgets/widgets.dart';
import 'package:football/locale/app_localization.dart';

const kActionIconImagePath = 'assets/icons/filter.png';

class ClubsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appTitle = AppLocalizations.of(context).appTitle;

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        actions: [
          ActionIconButton(
            imagePath: kActionIconImagePath,
            onPressed: () => _sortClubs(context),
          ),
        ],
      ),
      body: ClubsBody(),
    );
  }

  void _sortClubs(BuildContext context) =>
      context.read<ClubBloc>().add(ResortClubs());
}

class ClubsBody extends StatefulWidget {
  const ClubsBody({
    Key key,
  }) : super(key: key);

  @override
  _ClubsBodyState createState() => _ClubsBodyState();
}

class _ClubsBodyState extends State<ClubsBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ClubBloc, ClubState>(
          buildWhen: (previous, current) => current is! SortedBy,
          builder: (context, state) {
            return _releaseWidget(state);
          },
        ),
      ),
    );
  }

  Widget _releaseWidget(ClubState state) {
    if (state is Empty) {
      return MessageDisplay(message: 'No data');
    } else if (state is Error) {
      return MessageDisplay(message: state.message);
    } else if (state is Loading) {
      return LoadingWidget();
    } else if (state is Loaded) {
      return ClubsDisplay(state: state);
    }
    return MessageDisplay(message: 'Unhandled State');
  }

  @override
  void initState() {
    super.initState();
    context.read<ClubBloc>().add(GetClubsOnInit());
  }
}
