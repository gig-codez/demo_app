import 'package:demo_app/screens/about_screen.dart';
import 'package:demo_app/screens/sign_up.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  String text = "Home";
  Color color = Colors.brown.withOpacity(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Bruno"),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.indigo,
        backgroundColor: Colors.green,
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
        // bottom: TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.home),
        //       text: "Home",
        //     ),
        //     Tab(
        //       icon: Icon(Icons.search),
        //       text: "Search",
        //     ),
        //     Tab(
        //       icon: Icon(Icons.more_vert),
        //       text: "More",
        //     ),
        //   ],
        // ),
      ),
      // column => children[widget]
      // row => children [widget]
      body: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 50,
              fontWeight: FontWeight.w900,
              letterSpacing: 5,
            ),
          ),
          /**
           * AssetImage => the image loaded locally from the project or your machine
           * NetworkImage =>  this image is loaded via the network
           * MemoryImage => this renders bytes as images
           * FileImage => this is used to render images from the file system
           * 
           */
          const Image(
            image: AssetImage("assets/images/image.jpg"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          /**
           * Navigating apis
           * MaterialPageRoute => loads the page as is.
           * PageRouteBuilder => supports animations when routing
           * 
           */
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const SignUp();
              },
            ),
          );
          // page route builder
          // Navigator.of(context).push(
          //   PageRouteBuilder(
          //     transitionDuration: const Duration(milliseconds: 600),
          //     pageBuilder: (context, animation1, animation2) {
          //       return FadeTransition(
          //         opacity: animation1,
          //         child: const AboutScreen(
          //           name: "Bruno Mugamba",
          //         ),
          //       );
          //     },
          //   ),
          // );
        },
      ),
      /**
       * FloatingActionButton
       * ElevatedButton
       * TextButton
       * OutlinedButton
       * IconButton
       * MaterialButton
       */
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded), label: "Recents"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.voicemail), label: "Voicemail"),
        ],
      ),
    );
  }
}
