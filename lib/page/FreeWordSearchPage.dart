import 'package:flutter/material.dart';

class FreeWordSearchPage extends StatefulWidget {
  @override
  _FreeWordSearchPage createState() => _FreeWordSearchPage();
}

class _FreeWordSearchPage extends State<FreeWordSearchPage> {
  var _textFieldFocusNode;
  var _inputController = TextEditingController();
  var _chipList = List<Chip>();
  var _keyNumber = 0;

  @override
  void initState() {
    _textFieldFocusNode = FocusNode();
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void _onSubmitted(String text) {
    setState(() {
      _inputController.text = '';
      _addChip(text);
      FocusScope.of(context).requestFocus(_textFieldFocusNode);
    });
  }

  void _addChip(String text) {
    var chipKey = Key('chip_key_$_keyNumber');
    _keyNumber++;

    _chipList.add(
      Chip(
        key: chipKey,
        label: Text(text),
        onDeleted: () => _deleteChip(chipKey),
      ),
    );
  }

  void _deleteChip(Key chipKey) {
    setState(() => _chipList.removeWhere((Widget w) => w.key == chipKey));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(

            ),
            body: Column(children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      focusNode: _textFieldFocusNode,
                      autofocus: false,
                      controller: _inputController,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '食材・料理名で探す',
                      ),
                      onSubmitted: _onSubmitted,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 8.0,
                            runSpacing: 0.0,
                            direction: Axis.horizontal,
                            children: _chipList,
                          ),
                        ),
                      ],
                    ),
                  ])
            ])));
  }
}
