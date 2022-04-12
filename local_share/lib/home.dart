import 'package:flutter/material.dart';

import 'drawer.dart';
import 'locale.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.of(context).appName),
      ),
      drawer: const MainDrawer(),
      body: const Text('test')
    );
  }
}


