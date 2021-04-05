import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/club/presentation/pages/clubs_page.dart';
import 'package:football/injection_container.dart' as injection;

import 'club/presentation/bloc/club/club_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football',
      theme: ThemeData().copyWith(
        primaryColor: Color(0xFF01C13B),
      ),
      home:
          BlocProvider(create: (context) => sl<ClubBloc>(), child: ClubsPage()),
    );
  }
}
