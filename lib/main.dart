import 'package:flutter/material.dart';
import 'package:widget_extension_prac/extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Extension Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Extension Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isHovering = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _hoverEffect(bool value) {
    setState(() {
      _isHovering = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4FC),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ).addNeumorphism(),
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
              onHover: (value) {
                _hoverEffect(value);
              },
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('Increment'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                backgroundColor: const Color(0xFFEBEDFA),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(6),
                // ),
              ),
            ).addNeumorphism(
              blurRadius: _isHovering ? 10 : 0,
              offset: _isHovering ? const Offset(5, 5) : const Offset(0, 0),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
