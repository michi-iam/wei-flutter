
import 'package:flutter/material.dart';

class MeinButton extends StatefulWidget {
  //const MeinButton({Key? key}) : super(key: key);
  final Function parentFunction;
  MeinButton(this.parentFunction);

  @override
  _MeinButtonState createState() => _MeinButtonState();

}

class _MeinButtonState extends State<MeinButton>{
  bool _clicked = false;

  void _handleTap() {
    setState(() {
      _clicked = !_clicked;
    });

  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:() => { widget.parentFunction(), _handleTap() },
      child: Text(_clicked ? "hascht klickt" : "klick mich"),
      style: _clicked ? ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ) : ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
      ),
    );

  }

}


