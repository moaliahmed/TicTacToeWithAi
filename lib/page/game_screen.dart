import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoc/bloc/tic_tac_toe/tic_tac_toe_cubit.dart';
import 'package:tictactoc/component/box.dart';
import 'package:tictactoc/component/button_commponent.dart';
import 'package:tictactoc/component/text_component.dart';
import 'package:tictactoc/page/home_screen.dart';
import '../component/app_bar.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(
      {super.key, required this.isAi, required this.currentPlayer});
  final bool isAi;
  final String currentPlayer;
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  setInitWithFrind() {
    var cubit = BlocProvider.of<TicTacToeCubit>(context);
    widget.currentPlayer == 'X'
        ? cubit.currentPlayer = 'X'
        : cubit.currentPlayer = 'O';
    cubit.frindPlayer = cubit.currentPlayer;
    cubit.changeTurn();
    cubit.gameEnd = false;
    cubit.scourX = 0;
    cubit.scourY = 0;
  }

  @override
  void initState() {
    setInitWithFrind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f9f8),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                BlocProvider.of<TicTacToeCubit>(context)
                    .restartGame(widget.currentPlayer);
              },
              icon: const Icon(Icons.arrow_back))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
            padding:const EdgeInsets.symmetric(horizontal: 32),
            child: AppBarComponent(isAi: widget.isAi ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: BoxCommponent(isAi: widget.isAi),
          ),
          ButtonCommponent(
            text: 'Resturt Game',
            onTap: () {
              setState(
                () {
                  BlocProvider.of<TicTacToeCubit>(context)
                      .restartGame(widget.currentPlayer);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
