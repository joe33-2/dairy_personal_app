// import 'package:flutter/material.dart';
// import 're_enter.dart';

// class resScreen extends StatelessWidget {
//   const resScreen ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context); 
//           },
//           icon: const Icon(Icons.arrow_back),
//           color: Colors.black,
//         ),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               const Text('Enter Code:'),
//               const TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(onPressed: () {
//                 Navigator.push(
//                     context,
//                       MaterialPageRoute(
//                         builder: (context) => const ReEnter(),
//                       ),
//                 );
//               }, child: const Text('Reset')),
//             ],
//           ),
//       ),
//     );
//   }
// }
