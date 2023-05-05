import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tictactoc/component/button_commponent.dart';
import 'package:tictactoc/page/game_screen.dart';

class PickSide extends StatefulWidget {
  const PickSide({super.key, required this.isAi});

  final bool isAi;
  @override
  State<PickSide> createState() => _PickSideState();
}

class _PickSideState extends State<PickSide> {
  String? currentPlayer ='X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Pick Your Side',
            style: TextStyle(fontSize: 23),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/logo.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Radio(
                value: 'X',
                groupValue: currentPlayer,
                onChanged: (value) {
                  setState(() {
                    currentPlayer = value;
                   
                  });
                },
              ),
              Radio(
                value: 'O',
                groupValue: currentPlayer,
                onChanged: (value) {
                  setState(() {
                    currentPlayer = value;
                   
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonCommponent(
            text: 'Coutinue',
            onTap: () {
               Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(
                            isAi: widget.isAi, currentPlayer: currentPlayer!),
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
