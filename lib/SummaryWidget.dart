import 'package:flutter/material.dart';
import 'Leadeboard.dart';
import 'SaveScore.dart';

enum _SummaryActions { retry, save, home }

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({Key key, this.points}) : super(key: key);
  @required
  final int points;
  @override
  _SummaryWidgetState createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003049),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/rocket.png",
            width: 124,
            height: 124,
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Text(
              "You scored " + widget.points.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xfffcbf49),
                fontSize: 42,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Leaderboard(),
          _SummaryActionsWidget(
            onActionTap: (action) {
              switch (action) {
                case _SummaryActions.save:
                  showDialog(
                    context: context,
                    builder: (context) =>
                        saveScoreDialog(context, widget.points),
                  ).then((value) {
                    setState(() {});
                  });
                  break;
                case _SummaryActions.retry:
                  // TODO: Handle this case.
                  break;
                case _SummaryActions.home:
                  // TODO: Handle this case.
                  break;
              }
            },
          )
        ],
      ),
    );
  }
}

class _SummaryActionsWidget extends StatelessWidget {
  const _SummaryActionsWidget({Key key, this.onActionTap}) : super(key: key);

  final Function(_SummaryActions) onActionTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            color: Color(0xffe01e37),
            child: Icon(
              Icons.replay_outlined,
              color: Color(0xfffcbf49),
              size: 48,
            ),
            onPressed: () {
              onActionTap(_SummaryActions.retry);
            },
          ),
          MaterialButton(
            color: Color(0xffe01e37),
            child: Icon(
              Icons.save,
              color: Color(0xfffcbf49),
              size: 48,
            ),
            onPressed: () {
              onActionTap(_SummaryActions.save);
            },
          ),
          MaterialButton(
            color: Color(0xffe01e37),
            child: Icon(
              Icons.home,
              color: Color(0xfffcbf49),
              size: 48,
            ),
            onPressed: () {
              onActionTap(_SummaryActions.home);
            },
          ),
        ],
      ),
    );
  }
}
