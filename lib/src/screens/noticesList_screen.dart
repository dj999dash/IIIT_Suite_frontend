import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiit_suite/src/constants.dart';
import 'package:iiit_suite/src/controllers/notice_controller.dart';
import 'package:iiit_suite/src/widgets/noticeList_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BounceScroll extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      BouncingScrollPhysics();
}

class NoticeListScreen extends StatefulWidget {
  NoticeListScreen({Key key}) : super(key: key);

  @override
  _NoticeListScreenState createState() => _NoticeListScreenState();
}

class _NoticeListScreenState extends StateMVC<NoticeListScreen> {
  NoticeController _con;
  _NoticeListScreenState() : super(NoticeController()) {
    _con = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColour,
        body: RefreshIndicator(
          onRefresh: _con.refreshNotices,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(21.0, 12, 21, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                IntrinsicHeight(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 9,
                        child: RichText(
                          text: TextSpan(
                            text: "HELLO\n",
                            style: TextStyle(
                                color: kFontColour,
                                fontStyle: FontStyle.normal,
                                fontSize: 26,
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "B418045",
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      height: 1,
                                      color: kFontColour,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w800))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: new BoxDecoration(
                            color: kForegroundColour,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.more_vert,
                            color: kFontColour,
                            size: 39,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(color: kForegroundColour),
                        child: (_con.notices == null)
                            ? Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      kBackgroundColour),
                                ),
                              )
                            : NoticeListWidget(con: _con),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
