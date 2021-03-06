import 'package:flutter/material.dart';
import 'package:iiit_suite/src/constants.dart';
import 'package:iiit_suite/src/controllers/attendance_controller.dart';
import 'package:iiit_suite/src/models/user.dart';
import 'package:iiit_suite/src/widgets/mums/attendancelist_widget.dart';
import 'package:iiit_suite/src/widgets/mums/cachedAttendancelist_widget.dart';
import 'package:iiit_suite/src/widgets/mums/mums_drawer_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({Key key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends StateMVC<AttendanceScreen> {
  String id = '';
  String password = '';
  bool loading = false;
  AttendanceController _con;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void getCreds() {
    id = User().getId();
    password = User().getPassword();
  }

  _AttendanceScreenState() : super(AttendanceController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
    getCreds();
    if (AttendanceController.attendance == null ||
        AttendanceController.attendance.isEmpty) {
      _con.getAttendanceList();
      print('Attendance reload initiated');
    }
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacementNamed(context, '/home');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: kBackgroundColour,
          endDrawerEnableOpenDragGesture: true,
          endDrawer: MumsDrawerWidget(),
          body: RefreshIndicator(
            onRefresh: _con.refreshAttendance,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Column(
                children: <Widget>[
                  IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: RichText(
                            text: TextSpan(
                              text: "Attendance",
                              style: TextStyle(
                                  color: kFontColour,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  scaffoldKey.currentState.openEndDrawer();
                                },

                                child: Icon(
                                  Icons.dehaze,
                                  color: kFontColour,
                                  size: 30,
                                ),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: (AttendanceController.attendance == null)
                          ? CachedAttendanceListWidget()
                          : AttendanceListWidget(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
