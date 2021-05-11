import 'package:flutter/material.dart';
import 'Leadeboard.dart';

Dialog saveScoreDialog(BuildContext context, int score) {
  return Dialog(
    backgroundColor: Color(0xff003049),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    child: SaveScore(
      score: score,
    ),
  );
}

class SaveScore extends StatefulWidget {
  SaveScore({Key key, this.score}) : super(key: key);
  final int score;

  @override
  _SaveScoreState createState() => _SaveScoreState();
}

class _SaveScoreState extends State<SaveScore> {
  String inputedName;
  bool isSaveButtonEnabled = false;

  void onTextFieldUpdate(String name) {
    inputedName = name;
    isSaveButtonEnabled = name.length > 0;
  }

  void didTapToSaveScore() {
    UserScore.add(
      UserScore(
        inputedName,
        widget.score,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Insert a name",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xfffcbf49),
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: _NameTextField(
              onTextFieldUpdate: (value) => onTextFieldUpdate(value),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: Color(0xffe01e37),
                child: Icon(
                  Icons.close,
                  color: Color(0xfffcbf49),
                  size: 48,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              MaterialButton(
                color: Color(0xffe01e37),
                child: Icon(
                  Icons.save,
                  color: Color(0xfffcbf49),
                  size: 48,
                ),
                onPressed:
                    isSaveButtonEnabled ? null : () => didTapToSaveScore(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NameTextField extends StatelessWidget {
  const _NameTextField({Key key, this.onTextFieldUpdate}) : super(key: key);

  @required
  final Function(String) onTextFieldUpdate;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xfffcbf49),
        hintColor: Color(0xfffcbf49),
      ),
      child: TextField(
        cursorColor: Color(0xfffcbf49),
        maxLength: 12,
        autocorrect: false,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          color: Color(0xfffcbf49),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: "Name",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xfffcbf49),
            ),
          ),
        ),
        onChanged: (value) => onTextFieldUpdate(value),
      ),
    );
  }
}
