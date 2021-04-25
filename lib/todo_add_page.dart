import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

  final FocusNode _textNode = FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _textNode, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "閉じる",
                ),
              ),
            );
          },
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: KeyboardActions(
        config: _buildConfig(context),
        child: Container(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: height * 0.3,
                    width: width * 0.9,
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Text(
                          _text,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: width * 0.9,
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: TextField(
                              keyboardType: TextInputType.multiline,
                              focusNode: _textNode,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _text = value;
                                });
                              }),
                        ),
                      ),
                    ),
                  ),
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
          ),
        ),
      ),
    );
  }
}
