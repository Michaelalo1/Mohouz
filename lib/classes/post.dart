class Post {
  final String title;
  final String description;
  Post(this.title, this.description);
}

// child: Column(
//   children: const [
//     Expanded(
//       flex: 1,
//       child: IconButton(
//           onPressed: null,
//           icon: Icon(
//             Icons.minimize_rounded,
//             size: 40,
//             color: Color.fromRGBO(1, 1, 1, 0.7),
//           )),
//     ),
//     SizedBox(height: 5),
//     Expanded(
//       flex: 2,
//       child: TextButton(
//           onPressed: null,
//           child: Text(
//             'LOGIN',
//             style: TextStyle(
//               color: Color.fromRGBO(99, 25, 236, 1),
//             ),
//           )),
//     )
//   ],
// ),
