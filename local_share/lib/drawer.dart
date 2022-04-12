import 'package:flutter/material.dart';

import 'home.dart';
import 'locale.dart';
import 'settings.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                Strings.of(context).appName,
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 2.0),
              ),
            ),
          ),
          ListTile(
            title: Text(
              Strings.of(context).home,
              style:
              DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const Home()),
                      (route) => false);
            },
          ),
          ListTile(
            title: Text(
              Strings.of(context).settings,
              style:
              DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const Settings()),
                      (route) => false);
            },
          ),
        ],
      ),
    );
  }
}