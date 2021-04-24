import 'package:flutter/material.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
            ),
            TextField(onChanged: (String value) {
              setState(() {
                _text = value;
              });
            }),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, _text);
              },
              child: Text(
                '追加',
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'キャンセル',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
