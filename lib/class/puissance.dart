import 'package:flutter/material.dart';

class Puissance4{
  String joueur1 = "X";
  String joueur2 = "O";

  String nameJoueur1 = "joueur 1";
  String nameJoueur2 = "joueur 2";

  Color currentColor = Colors.black38;

  int scoreJ1 = 0;
  int scoreJ2 = 0;
  
  int bestScore = 0;

  String currentPlayer = "";
  String nomPlayer = "";
  bool gameEnd = false;
  List<String> estOccuper = [];

  void initGame(){
    currentPlayer = joueur1;
    nomPlayer = nameJoueur1;
    gameEnd = false;
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

  int getBestScore(){
    if(scoreJ1 > scoreJ2){
      bestScore = scoreJ1;
    } else {
      bestScore = scoreJ2;
    }
    return bestScore;
  }

  void changerTour(){
    if(currentPlayer == joueur1){
      currentPlayer = joueur2;
      nomPlayer = nameJoueur2;
    } else{
      currentPlayer = joueur1;
      nomPlayer = nameJoueur1;
    }
  }

  String headerText(){
    String tour = nomPlayer;
    String text = "Tour de $tour";
    return text;
  }
}