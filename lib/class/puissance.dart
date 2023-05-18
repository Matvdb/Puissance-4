import 'package:flutter/material.dart';

class Puissance4{
  String joueur1 = "X";
  String joueur2 = "O";

  Color couleurJ1 = Colors.red;
  Color couleurJ2 = Colors.yellow;
  Color currentColor = Colors.black38;

  int scoreJ1 = 0;
  int scoreJ2 = 0;
  
  int bestScore = 0;

  int code = 0;

  String currentPlayer = "";
  bool gameEnd = false;
  List<String> estOccuper = [];

  void initGame(){
    currentPlayer = joueur1;
    gameEnd = false;
    code = 0;
    estOccuper = [
      "", "", "", "", "", "",
      "", "", "", "", "", "",
      "", "", "", "", "", "",
      "", "", "", "", "", "",
      "", "", "", "", "", "",
      "", "", "", "", "", "",
      "", "", "", "", "", "",
    ];
  }

  void initScore(){
    scoreJ1 = 0;
    scoreJ2 = 0;
    bestScore = 0;
  }

  void changerTour(){
    if(currentPlayer == joueur1){
      currentColor = couleurJ2;
      code = 2;
      currentPlayer = joueur2;
    } else{
      currentPlayer = joueur1;
      code = 1;
      currentColor = couleurJ1;
    }
  }

  String headerText(){
    String tour = currentPlayer;
    String text = "Tour de $tour";
    return text;
  }
}