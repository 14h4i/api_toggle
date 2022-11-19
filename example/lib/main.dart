import 'package:api_toggle/api_toggle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Toggle Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int heartCount = 10;
  int callApiCount = 0;
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Toggle Demo'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'counter:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '$heartCount',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Call API counter:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '$callApiCount',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ApiToggle(
            activated: isActivated,
            delay: 1000,
            disabledChild: const Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 100,
            ),
            enabledChild: const Icon(
              Icons.favorite,
              color: Colors.redAccent,
              size: 100,
            ),
            onTrigger: (activated) {
              if (activated) {
                // write functions call API
                setState(() {
                  callApiCount = callApiCount + 1;
                });
              }
            },
            onTap: (activated) {
              // write other functions that are not API calls
              setState(() {
                heartCount = activated ? heartCount + 1 : heartCount - 1;
                isActivated = activated;
              });
            },
          ),
        ],
      )),
    );
  }
}
