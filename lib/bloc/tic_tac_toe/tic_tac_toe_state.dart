part of 'tic_tac_toe_cubit.dart';

@immutable
abstract class TicTacToeState {}

class TicTacToeInitial extends TicTacToeState {}
class TicTacToePlayerX extends TicTacToeState {}
class TicTacToePlayerY extends TicTacToeState {}
class TicTacToeGameEnd extends TicTacToeState {}
