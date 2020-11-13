import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart_demo/blocs/reader_bloc.dart';
import 'package:rxdart_demo/read.dart';



class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  ReaderBloc readerBloc;

  @override
  void dispose() {
    readerBloc.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    readerBloc = Provider.of<ReaderBloc>(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            children: [
              Text('Shakespeare\'s Sonets'),
              Text('Sonet 64'),
              RaisedButton(
                child: Text('Engage'),
                onPressed: (){
                  readerBloc.startReading();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Read()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
