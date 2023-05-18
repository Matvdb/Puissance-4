import 'package:flutter/material.dart';
import 'package:puissance_4/class/puissance.dart';
import 'package:puissance_4/ecrans/home.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  Puissance4 _puissance4 = new Puissance4();

  @override
  void initState(){
    super.initState();
    _puissance4.initGame();
  }

  _gameContainer(){
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6
        ),
        itemCount: 42,
        itemBuilder: (context, int index){
          return _box(index);
        }
      ),
    );
  }

  _box(int index){
    return InkWell(
      onTap: () {
        if (_puissance4.gameEnd || _puissance4.estOccuper[index].isNotEmpty) {
          return;
        }
        setState(() {
          _puissance4.estOccuper[index] = _puissance4.currentPlayer;
          _puissance4.changerTour();
          winner();
        });
      },
      child: Container(
        color: _puissance4.currentColor,
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            _puissance4.estOccuper[index],
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  winner() {
    List<List<int>> grilleWin = [
      [0, 1, 2, 3], [0, 6, 12, 18], [0, 7, 14, 21],
      [1, 2, 3, 4], [1, 7, 13, 19], [1, 8, 15, 22],
      [2, 3, 4, 5], [2, 8, 14, 20], [2, 9, 16, 23],
      [3, 2, 1, 0], [3, 8, 16, 18], [3, 9, 15, 21],
      [4, 3, 2, 1], [4, 9, 14, 19], [4, 10, 16, 22],
      [5, 4, 3, 2], [5, 10, 15, 20], [5, 11, 17, 23],
      [6, 7, 8, 9], [6, 12, 18, 24], [6, 13, 20, 27],
      [7, 8, 9, 10], [7, 13, 19, 25], [7, 14, 21, 28],
      [8, 9, 10, 11], [8, 14, 20, 26], [8, 15, 22, 29],
      [9, 8, 7, 6], [9, 14, 19, 24], [9, 15, 21, 27],
      [10, 9, 8, 7], [10, 15, 20, 25], [10, 16, 22, 28],
      [11, 10, 9, 8], [11, 16, 21, 26], [11, 17, 23, 29],
      [12, 13, 14, 15], [12, 18, 24, 30], [12, 19, 26, 33],
      [13, 14, 15, 16], [13, 19, 25, 31], [13, 20, 27, 34],
      [14, 15, 16, 17], [14, 20, 26, 32], [14, 21, 28, 35],
      [15, 14, 13, 12], [15, 20, 25, 30], [15, 21, 27, 33],
      [16, 15, 14, 13], [16, 21, 26, 31], [16, 22, 28, 34],
      [17, 16, 15, 14], [17, 22, 27, 32], [17, 23, 29, 35],
      [18, 12, 6, 0], [18, 24, 30, 36], [18, 19, 20, 21], [18, 13, 8, 3], [18, 25, 32, 39],
      [19, 13, 7, 1], [19, 20, 21, 22], [19, 14, 9, 4], [19, 25, 31, 37], [19, 26, 33, 40],
      [20, 21, 22, 23], [20, 14, 8, 2], [20, 15, 10, 5], [20, 27, 34, 41], [20, 26, 32, 38],
      [21, 20, 19, 18], [21, 26, 31, 36], [21, 15, 9, 3], [21, 27, 33, 39], [21, 14, 7, 0],
      [22, 21, 20, 19], [22, 15, 8, 1], [22, 16, 10, 4], [22, 28, 34, 40], [22, 27, 32, 37],
      [23, 22, 21, 20], [23, 16, 9, 2], [23, 17, 11, 5], [23, 29, 35, 41], [23, 28, 33, 38],
      [24, 25, 26, 27], [24, 18, 12, 6], [24, 19, 14, 9],
      [25, 26, 27, 28], [25, 19, 13, 7], [25, 20, 15, 10],
      [26, 27, 28, 29], [26, 20, 14, 8], [26, 21, 16, 11],
      [27, 26, 25, 24], [27, 20, 13, 6], [27, 21, 15, 9],
      [28, 27, 26, 25], [28, 21, 14, 7], [28, 22, 16, 10],
      [29, 28, 27, 26], [29, 22, 15, 8], [29, 23, 17, 11],
      [30, 31, 32, 33], [30, 24, 18, 12], [30, 25, 20, 15],
      [31, 32, 33, 34], [31, 25, 19, 13], [31, 26, 21, 16],
      [32, 33, 34, 35], [32, 26, 20, 14], [32, 27, 22, 17],
      [33, 32, 31, 30], [33, 26, 19, 12], [33, 27, 21, 15],
      [34, 33, 32, 31], [34, 27, 20, 13], [34, 28, 22, 16],
      [35, 34, 33, 32], [35, 28, 21, 14], [35, 29, 23, 17],
      [36, 30, 24, 18], [36, 31, 26, 21], [36, 37, 38, 39],
      [37, 31, 25, 19], [37, 32, 27, 22], [37, 38, 39, 40],
      [38, 32, 26, 20], [38, 33, 28, 23], [38, 39, 40, 41],
      [39, 38, 37, 36], [39, 32, 25, 18], [39, 33, 27, 21],
      [40, 39, 38, 37], [40, 33, 26, 19], [40, 34, 28, 32],
      [41, 40, 39, 38], [41, 34, 27, 20], [41, 35, 29, 23],
    ];

    for (var winPosition in grilleWin) {
      String grille0 = _puissance4.estOccuper[winPosition[0]];
      String grille1 = _puissance4.estOccuper[winPosition[1]];
      String grille2 = _puissance4.estOccuper[winPosition[2]];
      String grille3 = _puissance4.estOccuper[winPosition[3]];

      if (grille0.isNotEmpty) {
        if (grille0 == grille1 && grille0 == grille2 && grille0 == grille3) {
          _messageFin(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Le "),
              Text("$grille0 ", style: const TextStyle(fontWeight: FontWeight.bold),),
              const Text("à gagner !"),
            ],
          ));
          _puissance4.gameEnd = true;
          if(grille0 == "Joueur 1"){
            _puissance4.scoreJ1++;
          } else if(grille0 == "Joueur 2"){
            _puissance4.scoreJ2++;
          }
          return;
        }
      }
    }
  }

  Future<void> _messageFin(Row phrase) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Partie fini !', textAlign: TextAlign.center,),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                phrase,
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Quitter'),
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                });
              },
            ),
            TextButton(
              child: const Text('Recommencer'),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                  _puissance4.initGame();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_puissance4.headerText())
              ],
            ),
            _gameContainer(),
          ],
        ),
      ),
    );
  }
}