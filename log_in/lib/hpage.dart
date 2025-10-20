import 'package:flutter/material.dart';
import 'dpage.dart';
import 'wpage.dart';
import 'spage.dart';

class HomepageScreen extends StatefulWidget {
  static const String id = 'HomepageScreen';

  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomepageScreen> {
  int selectIndex = 0;

  final List<Widget> pages = [
    DiaryScreen(),
    WeatherScreen(),
    SpecialfeatureScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 63, 63, 63),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Name: Example',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
                const SizedBox(width: 16), 
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black12,
                  backgroundImage: NetworkImage(
                    'https://thumb.ac-illust.com/51/51e1c1fc6f50743937e62fca9b942694_t.jpeg',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 63, 63, 63),
        currentIndex: selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.auto_stories), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark), label: ''),
        ],
      ),
    );
  }
}
