import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'tic_tac_toe_state.dart';

class TicTacToeCubit extends Cubit<TicTacToeState> {
  TicTacToeCubit() : super(TicTacToeInitial());
  static TicTacToeCubit get(context) => BlocProvider.of(context);
  late int scourX;
  late int scourY;
  late String currentPlayer;
  String? SacendryPlayer;
  String? frindPlayer;
  late bool gameEnd;

  List<String> board = ['', '', '', '', '', '', '', '', ''];
  List<List<int>> winner = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  changeTurn() {
    if (currentPlayer == 'X') {
      SacendryPlayer = 'O';
    } else {
      SacendryPlayer = 'X';
    }
  }

  checkWinner() {
    for (var x in winner) {
      String Pos1 = board[x[0]];
      String Pos2 = board[x[1]];
      String Pos3 = board[x[2]];
      if (Pos1 == Pos2 && Pos2 == Pos3 && Pos1.isNotEmpty) {
        gameEnd = true;
        if (Pos2 == currentPlayer) {
          scourX++;
          emit(TicTacToePlayerX());
        } else {
          scourY++;
          emit(TicTacToePlayerY());
        }
        return 0;
      }
    }
    if (!board.contains('')) {
      gameEnd = true;
      emit(TicTacToeGameEnd());
    }
  }

  restartGame(String current) {
    board = ['', '', '', '', '', '', '', '', ''];
    gameEnd = false;
    currentPlayer = current;
  }

//************************************ */
  int minimax(bool isMaximizing, int depth) {
    final winner = getWinner();
    if (winner == 'X') {
      return 10 - depth;
    } else if (winner == 'O') {
      return depth - 10;
    } else if (winner == '' && isBoardFull()) {
      return 0;
    }

    if (isMaximizing) {
      int best = -1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          best = max(best, minimax(false, depth + 1));
          board[i] = '';
        }
      }
      return best;
    } else {
      int best = 1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          best = min(best, minimax(true, depth + 1));
          board[i] = '';
        }
      }
      return best;
    }
  }

  int getBestMove() {
    int bestMove = -1;
    int bestValue = -1000;
    for (int i = 0; i < 9; i++) {
      if (board[i] == '') {
        board[i] = 'X';
        int moveValue = minimax(false, 0);
        board[i] = '';
        if (moveValue > bestValue) {
          bestValue = moveValue;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }

  String getWinner() {
    List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for (var condition in winConditions) {
      if (board[condition[0]] != '' &&
          board[condition[0]] == board[condition[1]] &&
          board[condition[1]] == board[condition[2]]) {
        return board[condition[0]];
      }
    }

    return '';
  }

  bool isBoardFull() {
    return !board.contains('');
  }
}
