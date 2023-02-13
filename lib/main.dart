import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

void main() {runApp(MaterialApp(
     home:DooDee(),
  ),
  );
}

class DooDee extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '!!!DooDee!!!',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'DooDee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 47, 47),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'TOUCH THE BUTTON',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) => _counter % 2 == 0,
              widgetBuilder: (BuildContext context) {
                return Column(
                  children: <Widget>[
                    const Text(
                      'The number is even.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Icon(
                      Icons.check,
                      size: 60.0,
                      color: Colors.green,
                    ),
                  ],
                );
              },
              fallbackBuilder: (BuildContext context) {
                return Column(
                  children: <Widget>[
                    const Text(
                      'The number is not even.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Icon(
                      Icons.close,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}