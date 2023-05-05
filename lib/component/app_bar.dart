import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoc/component/text_component.dart';

import '../bloc/tic_tac_toe/tic_tac_toe_cubit.dart';


class AppBarComponent extends StatefulWidget {
  const AppBarComponent({
    super.key, required this.isAi,
  });
final bool isAi;
  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TicTacToeCubit, TicTacToeState>(
      listener: (context, state) {
        if (state is TicTacToePlayerX||state is TicTacToePlayerY) {
          setState(() {});
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextComponent(text: 'mo'),
          Container(
              width: 100,
              child: Center(
                child: TextComponent(
                  text:
                      '${BlocProvider.of<TicTacToeCubit>(context).scourX}- ${BlocProvider.of<TicTacToeCubit>(context).scourY}',
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(22),
                color: Color(0xfffbfdfd),
              )),
           TextComponent(text: widget.isAi?'Ai':'Frind')
        ],
      ),
    );
  }
}
