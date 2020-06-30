import 'package:flutter/material.dart';
import 'package:iiit_suite/src/screens/api_screen.dart';
import 'package:iiit_suite/src/screens/login_screen.dart';
import 'package:iiit_suite/src/screens/mums/noticeBookmark_screen.dart';
import 'package:iiit_suite/src/screens/mums/noticesList_screen.dart';
import 'package:iiit_suite/src/widgets/drawerEntries_widget.dart';
import 'package:iiit_suite/src/widgets/mums/drawerLogOut_entry.dart';

class DrawerItemsMums extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          DrawerEntries(
            title: 'Login board',
            route: LoginScreen(),
          ),
          DrawerEntries(
            title: 'Test board',
            route: Testing(),
          ),
          DrawerEntries(
            title: 'Notice board',
            route: NoticeListScreen(),
          ),
          DrawerEntries(
            title: 'Bookmarks',
            route: NoticeBookmarkScreen(),
          ),
          DrawerEntries(title: 'Student Notice Board'),
          DrawerEntries(title: 'View Grades'),
          DrawerEntries(title: 'View attendance'),
          DrawerEntries(title: 'Student Search'),
          DrawerEntries(title: 'Faculty Search'),
          DrawerEntries(title: 'Library'),
          Divider(
            color: Colors.white24,
            thickness: 1.5,
          ),
          DrawerEntries(title: 'About Developer'),
          DrawerEntries(title: 'Report Bug'),
          DrawerLogOutEntry(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.009,
          ),
        ],
      ),
    );
  }
}
