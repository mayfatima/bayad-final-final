import 'package:bayad/pages/bookmarks_page.dart';
import 'package:bayad/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//homepage
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onTap});
  final Function()? onTap;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
                );
                },
                icon: const Icon(Icons.search),
                ),
                const Text('Banks'
                ),
                ]
                ),
                ),
                drawer: NavigationDrawer(),
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            children: [
                              SizedBox(
                                width: 160.0,
                                height: 160.0,
                                child: Card(
                                  color: const Color.fromARGB(255, 21, 21, 21),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child:  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("lib/assets/bpi.ico"),
                                        ],
                                      )
                                    ),
                                  )
                                ),
                              )
                            ]
                          ),
                        )
                        ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                children: [
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: Card(
                                        color: const Color.fromARGB(255, 21, 21, 21),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child:  Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Image.asset("lib/assets/bpi.ico"),
                                                ],
                                              )
                                          ),
                                        )
                                    ),
                                  )
                                ]
                            ),
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                children: [
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: Card(
                                        color: const Color.fromARGB(255, 21, 21, 21),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child:  Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Image.asset("lib/assets/bpi.ico"),
                                                ],
                                              )
                                          ),
                                        )
                                    ),
                                  )
                                ]
                            ),
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                children: [
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: Card(
                                        color: const Color.fromARGB(255, 21, 21, 21),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child:  Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Image.asset("lib/assets/bpi.ico"),
                                                ],
                                              )
                                          ),
                                        )
                                    ),
                                  )
                                ]
                            ),
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                children: [
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: Card(
                                        color: const Color.fromARGB(255, 21, 21, 21),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child:  Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Image.asset("lib/assets/bpi.ico"),
                                                ],
                                              )
                                          ),
                                        )
                                    ),
                                  )
                                ]
                            ),
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                children: [
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: Card(
                                        color: const Color.fromARGB(255, 21, 21, 21),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child:  Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Image.asset("lib/assets/bpi.ico"),
                                                ],
                                              )
                                          ),
                                        )
                                    ),
                                  )
                                ]
                            ),
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                children: [
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: Card(
                                        color: const Color.fromARGB(255, 21, 21, 21),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child:  Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Image.asset("lib/assets/bpi.ico"),
                                                ],
                                              )
                                          ),
                                        )
                                    ),
                                  )
                                ]
                            ),
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                children: [
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: Card(
                                        color: const Color.fromARGB(255, 21, 21, 21),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child:  Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Image.asset("lib/assets/bpi.ico"),
                                                ],
                                              )
                                          ),
                                        )
                                    ),
                                  )
                                ]
                            ),
                          )
                      ),

                    ]
                    ),
)
    );
  }

}

class CustomSearchDelegate extends SearchDelegate {

  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelons',
  ];

  @override
  List <Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  } 

  @override
  Widget buildSuggestions(BuildContext context){

    List<String> matchQuery = [];
    for (var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        
        );
      }
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

  Widget buildHeader(BuildContext context) => Material(
    color: Colors.blue.shade700,
    child: InkWell(
      onTap: () {
        //close navigation drawer before
        Navigator.pop(context);

        //push to profile
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProfilePage(),
          ));
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: [
              const CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage('https://pbs.twimg.com/media/GBy419oW4AAlJQt?format=jpg&name=medium'),
            ),
            const SizedBox(
              height:12
            ),
            const Text(
              'WOOZI',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
                )),
            Text(
              FirebaseAuth.instance.currentUser?.email ?? 'No email',
              style: const TextStyle(
                color: Colors.white
                )),
          ],
        ),
      ),
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