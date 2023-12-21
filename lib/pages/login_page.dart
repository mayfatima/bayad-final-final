import 'package:bayad/pages/bookmarks_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//homepage
class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onTap});
  final Function()? onTap;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromRGBO(243,223,206,1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250,209,169,1),
        title: const Text('Bank'),
      ),
      drawer: NavigationDrawer(),
    );
  }

}

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({super.key});

    final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(243,223,206,1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      )
    );
  }

  Widget buildHeader(BuildContext context) => Container(

    color: Colors.blue.shade700,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Column(
      children: [
          CircleAvatar(
          radius: 52,
          child: Image.network('https://www.pinterest.ph/pin/635852041153597974/'),
        ),
        const SizedBox(
          height:12
        ),
        Text(
          FirebaseAuth.instance.currentUser?.email ?? 'No email'),
      ],
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_filled,
            color: Colors.white),
            title: Text('Home',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold
            )),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginPage() ));
            },
          ),
    
          ListTile(
            leading: const Icon(Icons.bookmarks,
            color: Colors.white),
            title: Text('Bookmarks',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,            
            )),
            onTap: () {

              //close navigation drawer before
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BookmarkPage() ));},
          ),
    
          ListTile(
            leading: const Icon(Icons.folder_rounded,
            color: Colors.white),
            title: Text('History of Transactions',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            )),
            onTap: () {},
          ),
    
          ListTile(
            leading: const Icon(Icons.chat_bubble_rounded,
            color: Colors.white),
            title: Text('Messaging',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            )),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.logout_rounded,
            color: Colors.white),
            title: Text('Sign Out',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            )),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ]),
  );

}