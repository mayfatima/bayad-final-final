import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:bayad/pages/login_page.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),


    );
  }
}
