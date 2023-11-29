import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'SPORT SCAVENGER HUNT',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void _showDialogW(BuildContext context, String i) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          "VICTORY",
          textAlign: TextAlign.center,
        ),
        content: new Text(
          "Congratulations! You have found the $i!\nPress and hold PLAY to play again.",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new ElevatedButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _showDialogL(BuildContext context, String i) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          "FAILURE",
          textAlign: TextAlign.center,
        ),
        content: new Text(
          "You have not found the $i!\nPress and hold PLAY to play again.",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new ElevatedButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _basketballinfo(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          "Basketball",
          textAlign: TextAlign.center,
        ),
        content: new Text(
          "Basketball was invented in 1891 by James Naismith in Springfield, Massachusetts.\nOne of the most popular modern basketball leagues is the National Basketball Association (NBA).",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new ElevatedButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _footballinfo(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          "Football",
          textAlign: TextAlign.center,
        ),
        content: new Text(
          "Football was invented in 1859 by  Walter Camp in the United States .\nOne of the most popular modern football leagues is the National Football League (NFL).",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new ElevatedButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _futballinfo(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          "Fútball",
          textAlign: TextAlign.center,
        ),
        content: new Text(
          "Fútball has been played for centuries and its official date and location of origin are unknown.\nOne of the most popular modern fútbol leagues is the Fédération internationale de football (FIFA).",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new ElevatedButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _baseballinfo(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          "Baseball",
          textAlign: TextAlign.center,
        ),
        content: new Text(
          "Baseball was invented in 1845 by Alexander Cartwright in New York City.\nOne of the most popular modern baseball leagues is Major League Baseball (MLB).",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new ElevatedButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _player(BuildContext context, String name, String path) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          "$name",
          textAlign: TextAlign.center,
        ),
        content: new Image(
          image: AssetImage(path),
        ),
        actions: <Widget>[
          new ElevatedButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Random random = new Random();

class _MyHomePageState extends State<MyHomePage> {
  int timeLeft = 60;
  var words = ['Basketball', 'Football', 'Fútbol', 'Baseball'];
  var i = random.nextInt(4);

  // timer method
  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
        style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              width: 100,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(4.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Text(
                timeLeft == 0 ? 'DONE' : timeLeft.toString(),
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            MaterialButton(
              onPressed: () {
                _startCountDown;
              },
              onLongPress: () {
                timeLeft = 61;
                i = random.nextInt(4);
                _startCountDown();
              },
              child: Text(
                'P L A Y',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurple,
            ),
            Text(
              "Find the ${words.elementAt(i)} (Tap on the correct ball)\nPress and hold PLAY to time yourself",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            //Text("Find the ${words.elementAt(i)}\n(Tap on the correct ball)"),
            //Text("Drag horizontally on any ball to find out its origins."),
            SizedBox(
              width: 150,
              height: 601.5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (i == 0) {
                          _showDialogW(context, words.elementAt(i));
                        } else {
                          _showDialogL(context, words.elementAt(i));
                        }
                      },
                      onHorizontalDragStart: (DragStartDetails details) {
                        _basketballinfo(context);
                      },
                      onDoubleTap: () {
                        _player(context, "Basketball", "lib/assets/lebron.png");
                      },
                      child: Image(
                        image:
                            AssetImage('lib/assets/${words.elementAt(0)}.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (i == 1) {
                          _showDialogW(context, words.elementAt(i));
                        } else {
                          _showDialogL(context, words.elementAt(i));
                        }
                      },
                      onHorizontalDragStart: (DragStartDetails details) {
                        _footballinfo(context);
                      },
                      onDoubleTap: () {
                        _player(context, "Football", "lib/assets/TomBrady.png");
                      },
                      child: Image(
                        image:
                            AssetImage('lib/assets/${words.elementAt(1)}.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (i == 2) {
                          _showDialogW(context, words.elementAt(i));
                        } else {
                          _showDialogL(context, words.elementAt(i));
                        }
                      },
                      onHorizontalDragStart: (DragStartDetails detials) {
                        _futballinfo(context);
                      },
                      onDoubleTap: () {
                        _player(context, "Fútbol", "lib/assets/messi.png");
                      },
                      child: Image(
                        image:
                            AssetImage('lib/assets/${words.elementAt(2)}.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (i == 3) {
                          _showDialogW(context, words.elementAt(i));
                        } else {
                          _showDialogL(context, words.elementAt(i));
                        }
                      },
                      onHorizontalDragStart: (DragStartDetails details) {
                        _baseballinfo(context);
                      },
                      onDoubleTap: () {
                        _player(context, "Baseball", "lib/assets/baberuth.png");
                      },
                      child: Image(
                        image:
                            AssetImage('lib/assets/${words.elementAt(3)}.png'),
                      ),
                    ),
                    
                  ]),
            ),
          Text("(Horizontally Drag or Double Tap on balls for fun)",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),]),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
