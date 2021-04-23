import 'package:flutter/material.dart';

class TodoAddPage extends StatelessWidget {
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
              'リスト追加',
            ),
            TextField(),
            RaisedButton(
              onPressed: () {
                //todo
              },
              child: Text(
                '追加',
              ),
            ),
            FlatButton(
              onPressed: () {
                //todo
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
