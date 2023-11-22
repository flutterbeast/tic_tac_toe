import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String diplayX = '';

  bool ChangeO = true;
  List<String> displayX = ['', '', '', '', '', '', '', '', ''];

  var playerOstyle = TextStyle(
      fontSize: 20, color: Colors.red, );
  var playerXstyle = TextStyle(
    fontSize: 20, color: Colors.blue, );

  int countXwin = 0;
  int countOwin = 0;

  int fullbox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Column(
                      children: [
                        Text('Player: O', style: playerOstyle,),
                        Text(countOwin.toString(), style: playerOstyle,),

                      ],
                    ),
                    Column(
                      children: [
                        Text('Player: X', style: playerXstyle,),
                        Text(countXwin.toString(), style: playerXstyle,),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),),
          SizedBox(height: 20,),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: displayX.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                Color textColor =
                displayX[index] == 'O' ? Colors.red : Colors.blue;

                return GestureDetector(
                  onTap: () {
                    tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        displayX[index],
                        style: TextStyle(
                          fontSize: 40,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(child: Container(),),
        ],
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (ChangeO && displayX[index] == '') {
        displayX[index] = 'O';
        fullbox += 1;
      } else if (!ChangeO && displayX[index] == '') {
        displayX[index] = 'X';
        fullbox += 1;
      }
      ChangeO = !ChangeO;
      checkwinner();
    });
  }

  void checkwinner() {
    if (displayX[0] == displayX[1] &&
        displayX[0] == displayX[2] &&
        displayX[0] != '') {
      showwindialog(displayX[0]);
    }
    if (displayX[3] == displayX[4] &&
        displayX[3] == displayX[5] &&
        displayX[3] != '') {
      showwindialog(displayX[3]);
    }
    if (displayX[6] == displayX[7] &&
        displayX[6] == displayX[8] &&
        displayX[6] != '') {
      showwindialog(displayX[6]);
    }
    if (displayX[0] == displayX[3] &&
        displayX[0] == displayX[6] &&
        displayX[0] != '') {
      showwindialog(displayX[0]);
    }
    if (displayX[1] == displayX[4] &&
        displayX[1] == displayX[7] &&
        displayX[1] != '') {
      showwindialog(displayX[1]);
    }
    if (displayX[2] == displayX[5] &&
        displayX[2] == displayX[8] &&
        displayX[2] != '') {
      showwindialog(displayX[2]);
    }
    if (displayX[6] == displayX[4] &&
        displayX[6] == displayX[2] &&
        displayX[6] != '') {
      showwindialog(displayX[6]);
    }
    if (displayX[0] == displayX[4] &&
        displayX[0] == displayX[8] &&
        displayX[0] != '') {
      showwindialog(displayX[0]);
    }
    else if(fullbox == 9){
      showdrawdialog();
    }
  }
  void showdrawdialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Draw"),
          actions:  [
            TextButton(onPressed: (){
              _clearBoard();
              Navigator.of(context).pop();
            }, child: Text("Play Again")),
          ],
        );
      },
    );
  }
  void showwindialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Winner is:  " + winner),
          actions:  [
            TextButton(onPressed: (){
              _clearBoard();
              Navigator.of(context).pop();
            }, child: Text("Play Again")),
          ],
        );
      },
    );
    if(winner == 'O'){
      countOwin += 1;
    } else {
      countXwin += 1;
    }
  }
  void _clearBoard(){
    setState(() {
      for(int i = 0; i<9; i++ ){
        displayX[i] = '';
      }
    });
    fullbox = 0;
  }
//  ______________________  this function is for single type _______________________________________
// void tapped(){
//   setState(() {
//     diplayX = 'o';
//   });
// }
}
