import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mohouz/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
        title: 'Mohouz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('an error occured'));
                  } else {
                    return HomeScreen();
                  }
                }),
          ),
        );
      }
    });
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(99, 25, 236, animation.value),
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
                              Icons.minimize,
                              size: 40,
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                            )),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0)),
                                    color: Color.fromRGBO(117, 117, 117, 1),
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40)),
                                      color: Color.fromRGBO(99, 25, 236, 1),
                                    ),
                                    height: 800,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40)),
                                        color: Colors.white,
                                      ),
                                      height: 800,
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Expanded(child: TextField()),
                                          Expanded(child: TextField()),
                                          const Expanded(
                                            child: ElevatedButton(
                                                onPressed: null,
                                                child: Text('submit')),
                                          ),
                                          ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 20,
                                                primary: Colors.white,
                                                onPrimary:
                                                    Colors.deepPurpleAccent,
                                                minimumSize:
                                                    Size(double.infinity, 50),
                                              ),
                                              onPressed: () {
                                                final provider = Provider.of<
                                                        GoogleSignInProvider>(
                                                    context,
                                                    listen: false);
                                                provider.googleLogin();
                                              },
                                              icon: const FaIcon(
                                                FontAwesomeIcons.google,
                                                color: Colors.blue,
                                              ),
                                              label: const Text(
                                                'Sign Up with Google',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        ],
                                      ),
                                    ),
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
                          child: const Text(
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
                  child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0)),
                                color: Color.fromRGBO(117, 117, 117, 1),
                              ),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: double.infinity,
                                  minHeight: 500,
                                  maxWidth: double.infinity,
                                  maxHeight: 900,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 50.0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40)),
                                    color: Colors.white,
                                  ),
                                  height: 800,
                                  width: double.infinity,
                                  child: Column(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          'Sign up for Mohouz',
                                          style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Color.fromRGBO(
                                                  99, 25, 236, 0.8),
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      // Expanded(
                                      //   child: ElevatedButton.icon(
                                      //       style: ElevatedButton.styleFrom(
                                      //         elevation: 1,
                                      //         primary: Colors.white,
                                      //         onPrimary:
                                      //             Colors.deepPurpleAccent,
                                      //         minimumSize:
                                      //             Size(double.infinity, 50),
                                      //       ),
                                      //       onPressed: () {
                                      //         final provider = Provider.of<
                                      //                 GoogleSignInProvider>(
                                      //             context,
                                      //             listen: false);
                                      //         provider.googleLogin();
                                      //       },
                                      //       icon: const FaIcon(
                                      //         FontAwesomeIcons.google,
                                      //         color: Color.fromRGBO(
                                      //             66, 133, 244, 1),
                                      //       ),
                                      //       label: const Text(
                                      //         'Sign Up With Google',
                                      //         style: TextStyle(
                                      //             fontFamily: 'Raleway',
                                      //             color: Colors.black),
                                      //       )),
                                      // ),
                                      // SizedBox(height: 5),
                                      Expanded(child: TextField()),
                                      Expanded(child: TextField()),
                                      Expanded(child: TextField()),
                                      Expanded(child: TextField()),
                                      Expanded(
                                        child: ElevatedButton(
                                            onPressed: null,
                                            child: Text('submit')),
                                      ),
                                    ],
                                  ),
                                ),
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
                      child: const Text(
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
