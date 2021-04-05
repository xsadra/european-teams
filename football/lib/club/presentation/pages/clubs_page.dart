import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/club/domain/entities/club.dart';
import 'package:football/club/presentation/bloc/club/bloc.dart';
import 'package:football/club/presentation/widgets/action_icon_button.dart';
import 'package:football/club/presentation/widgets/custom_list_tile.dart';

const kActionIconImagePath = 'assets/icons/filter.png';

class ClubsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('all about clubs'),
        actions: [
          ActionIconButton(
            imagePath: kActionIconImagePath,
            onPressed: () => context.read<ClubBloc>().add(ResortClubs()),
          ),
        ],
      ),
      body: ClubsBody(),
    );
  }
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
          builder: (context, state) {
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
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ClubBloc>().add(GetClubsE());
  }
}

class ClubsDisplay extends StatelessWidget {
  final Loaded state;

  ClubsDisplay({
    this.state,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.clubs.length,
      itemBuilder: (context, index) {
        Club club = state.clubs.elementAt(index);
        return CustomListTile(
          club: club,
          onTap: () async {},
        );
      },
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

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
            style: TextStyle(fontSize: 25.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
