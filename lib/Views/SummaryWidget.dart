import 'package:flutter/material.dart';
import 'Leadeboard.dart';
import 'SaveScore.dart';

enum SummaryActions { retry, save, home }

class SummaryView extends StatefulWidget {
  const SummaryView({Key key, this.points}) : super(key: key);
  @required
  final int points;
  @override
  _SummaryViewState createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
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
                case SummaryActions.save:
                  showDialog(
                    context: context,
                    builder: (context) =>
                        saveScoreDialog(context, widget.points),
                  ).then((value) {
                    setState(() {});
                  });
                  break;
                case SummaryActions.retry:
                  Navigator.of(context).pop(action);
                  break;
                case SummaryActions.home:
                  Navigator.of(context).popUntil((route) => route.isFirst);
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

  final Function(SummaryActions) onActionTap;
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
              onActionTap(SummaryActions.retry);
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
              onActionTap(SummaryActions.save);
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
              onActionTap(SummaryActions.home);
            },
          ),
        ],
      ),
    );
  }
}
