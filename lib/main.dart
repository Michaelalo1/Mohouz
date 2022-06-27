import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Mohouz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(99, 25, 236, controller.value),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'anthill.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'HOUSE FOR RENT',
                  style: TextStyle(
                      color: Color.fromRGBO(169, 169, 189, 1),
                      fontSize: 18,
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 5,
                      fontWeight: FontWeight.w300),
                )
              ]),
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 60, left: 20),
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    size: 50,
                    color: Color.fromRGBO(99, 25, 236, 1),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Discover',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 28.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      RichText(
                        text: const TextSpan(
                            text: 'Your ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SourceSansPro',
                                fontSize: 23.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal),
                            children: [
                              TextSpan(
                                text: 'dream home',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 23.0,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      )
                      // Text(
                      //   'Your Dream Home',
                      //   style: TextStyle(
                      //       color: Colors.black87,
                      //       fontSize: 20.0,
                      //       decoration: TextDecoration.none,
                      //       fontWeight: FontWeight.normal),
                      // ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
