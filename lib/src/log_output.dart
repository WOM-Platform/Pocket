import 'package:flutter/material.dart';
import 'package:wom_pocket/src/my_logger.dart';

class LogOutputScreen extends StatefulWidget {
  const LogOutputScreen({super.key});

  @override
  State<LogOutputScreen> createState() => _LogOutputScreenState();
}

class _LogOutputScreenState extends State<LogOutputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(actions: [ IconButton(
                    icon: Icon(Icons.clear),
                    color: Colors.red,
                    onPressed: () {
                      devOutput = '';
                      setState(() {

                      });
                    }),],),
      body: SingleChildScrollView(
        child: Text(devOutput,style: TextStyle(fontSize: 12),),
      ),
    );
  }
}
