import 'package:demo_app/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/tile_widget.dart';

class AboutScreen extends StatefulWidget {
  final String name;
  const AboutScreen({super.key, required this.name});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
// function  to return data stored in our sharedprefence
/**
 * [key] => [value]
 * String, int , double Map List
 */
  Future<List<String>> getNames() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> names = await prefs.getStringList("names") ?? [];
    return names;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      /**
       * Scrolling widgets
       * - ListView widget => ListView.builder() ListView.separated()[has a separated function]
       * - SingleChildScrollView widget
       * - NestedScrollView widget // => for complex ui refer to the book
       * 
       * Non scrollable widgets
       * - column
       * - Row
       * - Flex => display content in both row and column views
       * - Stack
       */
      // helper functions to manipulate a list
      /**>
       * List.generate() => returns an array of elements
       * List.map() returns a map of elements(grouped data which can be converted to a list.)
       * List.where() return an iterable object of elements which converted to an array
       * List.find() return the first element that meets the condition
       * List.sort()
       * List.remove()
       * List.add(); => 
       * List.addAll([])
       * List.indexOf() => return the index of the element that matches the predicate(condition)
       */
      // map usage => names.map((name) => tile(name)).toList()
      // where usage =>names.where((name) => name == "Ben").toList().map((selected) => tile(selected)).toList()
      //  SharedPeferences => https://pub.dev/packages/shared_preferences
      // FutureBuilder => handle data that is in async await state.
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("data"),
          ),
          Expanded(
            child: FutureBuilder(
                future: getNames(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text("An error occured"));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return tile(snapshot.data?[index] ?? "");
                    },
                  );
                }),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DataService.setData(["name", "name2", "name3"]);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
