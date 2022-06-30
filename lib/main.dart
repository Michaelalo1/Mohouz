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
            padding: const EdgeInsets.only(left: 16, top: 15),
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
                suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey,
                    )),
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
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/house-locator.png')),
          ),

          // SearchBar(onSearch: onSearch, onItemFound: onItemFound)
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: const [
          //     Text(
          //       'Categories',
          //       style: TextStyle(
          //           fontSize: 27,
          //           fontWeight: FontWeight.w500,
          //           fontFamily: 'Raleway'),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}

// TextField(
// decoration: const InputDecoration(
// hintStyle: TextStyle(
// fontSize: 20,
// color: Colors.grey,
// fontFamily: 'Raleway',
// fontWeight: FontWeight.w500),
// border: InputBorder.none,
// hintText: 'New York City',
// contentPadding: EdgeInsets.all(15),
// ),
// onChanged: (value) {
// searchedLocation = value; // do something
// },
// ),

// class SearchResults extends StatefulWidget {
//   const SearchResults({Key? key}) : super(key: key);
//
//   @override
//   State<SearchResults> createState() => _SearchResultsState();
// }
//
// class _SearchResultsState extends State<SearchResults> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
