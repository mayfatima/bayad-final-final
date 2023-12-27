import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:bayad/pages/login_page.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: const Color.fromARGB(255, 243, 223, 206),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Row (
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Request'),
          ],

      ),
      )

    );
  }
}
