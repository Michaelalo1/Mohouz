import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
                      fontFamily: 'Raleway-Regular',
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
                      fontFamily: 'Raleway-Regular',
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
  String searchedLocation = 'Lagos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 85, left: 20),
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
                      width: 7,
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
                                  fontFamily: 'Raleway-Regular',
                                  fontSize: 24.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal),
                              children: [
                                TextSpan(
                                  text: 'dream home.',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1),
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(left: 16, top: 15, right: 25),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  blurRadius: 100.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    1.0, // Move to right 10  horizontally
                    1.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: TextField(
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.mic_none_outlined,
                  size: 31,
                  color: Colors.grey,
                ),
                hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500),
                border: InputBorder.none,
                hintText: 'New York City',
                contentPadding: EdgeInsets.all(15),
              ),
              onChanged: (value) {
                searchedLocation = value; // do something
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 350,
            child: Image.asset('assets/nobgredhouse.png'),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 200,
                    maxWidth: double.infinity,
                    maxHeight: 400,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 190,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                      color: Color.fromRGBO(99, 25, 236, 1),
                    ),
                    child: Column(
                      children: [
                        const IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.minimize_rounded,
                              size: 40,
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                            )),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30)),
                                      color: Color.fromRGBO(99, 25, 236, 1),
                                    ),
                                    height: 400,
                                  ),
                                );
                                // return Wrap(
                                //   children: [
                                //     ListTile(
                                //       leading: Icon(Icons.share),
                                //       title: Text('Share'),
                                //     ),
                                //     ListTile(
                                //       leading: Icon(Icons.copy),
                                //       title: Text('Copy Link'),
                                //     ),
                                //     ListTile(
                                //       leading: Icon(Icons.edit),
                                //       title: Text('Edit'),
                                //     ),
                                //   ],
                                // );
                              },
                            );
                          },
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                                fontSize: 23,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 70,
                  maxWidth: double.infinity,
                  maxHeight: 90,
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 26),
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60),
                      ),
                      color: Colors.white),
                  child: const TextButton(
                      onPressed: null,
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                          fontSize: 23,
                          color: Color.fromRGBO(99, 25, 236, 1),
                        ),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
