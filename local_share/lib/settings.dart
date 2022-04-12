import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_share/drawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'locale.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  _SettingsState();

  Map<String, dynamic>? settings;

  @override
  void initState() {
    super.initState();
    loadSettings().then((value) => {
          setState(() {
            settings = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.of(context).settings),
        ),
        drawer: const MainDrawer(),
        body: Center(
          child: settings != null
              ? const Text("loaded")
              : const CircularProgressIndicator(),
        ));
  }
}

const String settingsFile = 'settings.json';

Future<Map<String, dynamic>> loadSettings() async {
  final directory = await getApplicationSupportDirectory();
  final targetPath = path.join(directory.path, settingsFile);
  if (await File(targetPath).exists()) {
    return json.decode(targetPath);
  } else {
    return restoreDefaultSettings();
  }
}

Map<String, dynamic> getDefaultSettings() {
  return {'listen_port': 21370};
}

Future<Map<String, dynamic>> restoreDefaultSettings() async {
  final settings = getDefaultSettings();
  saveSettings(getDefaultSettings());
  return settings;
}

void saveSettings(Map<String, dynamic> settings) async {
  final directory = await getApplicationSupportDirectory();
  final targetPath = path.join(directory.path, settingsFile);
  const encoder = JsonEncoder.withIndent('    ');
  File(targetPath).writeAsStringSync(encoder.convert(settings));
}
