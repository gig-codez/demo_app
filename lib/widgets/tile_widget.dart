import 'package:flutter/material.dart';

Widget tile(String name) {
  return ListTile(
    leading: Text("0"),
    title: Text(name),
    subtitle: Text(
      "Software Engineer",
    ),
    trailing: Text("98"),
    onTap: () {
      print("You tapped me");
    },
    onLongPress: () {
      print("You longpress me");
    },
  );
}
