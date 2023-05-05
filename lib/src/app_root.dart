import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoc/bloc/tic_tac_toe/tic_tac_toe_cubit.dart';
import 'package:tictactoc/page/Pick_side.dart';
import 'package:tictactoc/page/home_screen.dart';

import '../page/game_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TicTacToeCubit(),
        ),
      
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
