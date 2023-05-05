import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoc/bloc/tic_tac_toe/tic_tac_toe_cubit.dart';
import 'package:tictactoc/component/icon_commponent.dart';
import 'package:tictactoc/component/text_component.dart';

class BoxCommponent extends StatefulWidget {
  const BoxCommponent({
    super.key,
    required this.isAi,
  });
  //final List<String> occupied;
//  final String currentPlayer;
  final bool isAi;

  @override
  State<BoxCommponent> createState() => _BoxCommponentState();
}

class _BoxCommponentState extends State<BoxCommponent> {
showSnackBar(String winer){
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              winer,
              textAlign: TextAlign.center,
              style:const TextStyle(fontSize: 22),
            ),
          ));
}

  logicFrind(int index) {
    setState(() {
      var cubit = BlocProvider.of<TicTacToeCubit>(context);
      cubit.board[index] = cubit.frindPlayer!;
      cubit.checkWinner();
      if (cubit.currentPlayer == cubit.frindPlayer) {
        cubit.frindPlayer = cubit.SacendryPlayer;
      } else {
        cubit.frindPlayer = cubit.currentPlayer;
      }
    });
  }

  logicAi(int index) {
    setState(() {
      var cubit = BlocProvider.of<TicTacToeCubit>(context);
      if (cubit.board[index].isEmpty && cubit.gameEnd == false) {
        cubit.board[index] = cubit.currentPlayer;
        BlocProvider.of<TicTacToeCubit>(context).checkWinner();
        if (!cubit.gameEnd && cubit.board.isNotEmpty) {
          int bast = BlocProvider.of<TicTacToeCubit>(context).getBestMove();
          print(bast);
          bast == -1 ? '' : cubit.board[bast] = cubit.SacendryPlayer!;
          cubit.checkWinner();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicTacToeCubit, TicTacToeState>(
      listener: (context, state) {
        if (state is TicTacToePlayerX) {
          showSnackBar('Game End player Mo is Won');
        } else if (state is TicTacToePlayerY) {
         widget.isAi?showSnackBar('Game End player Ai is Won'):showSnackBar('Game End player YourFrind is Won');
        }else if (state is TicTacToeGameEnd){
          showSnackBar('Game End Two Player is Draw');
        }
      },
      builder: (context, state) {
        var cubit = TicTacToeCubit.get(context);
        return Container(
          decoration: BoxDecoration(
              color: Color(0xfffdfdfd),
              borderRadius: BorderRadius.circular(22)),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    widget.isAi ? logicAi(index) : logicFrind(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: cubit.board[index].isEmpty
                            ? Colors.black26
                            : Colors.orange),
                    margin: const EdgeInsets.all(8),
                    child: Center(
                      child: cubit.board[index].isEmpty
                          ? const Text('')
                          : cubit.board[index] == 'X'
                              ? const IconCommponent(
                                  image: AssetImage('assets/x.png'),
                                  color: Colors.orange)
                              : const IconCommponent(
                                  image: AssetImage('assets/o.png'),
                                  color: Colors.blue),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
