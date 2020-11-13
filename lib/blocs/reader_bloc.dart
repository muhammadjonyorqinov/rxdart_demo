import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:rxdart/subjects.dart';

class ReaderBloc{
  final _dartStream = StreamController<String>();
  final _publishStream = PublishSubject<String>();
  final _behaviorStream = BehaviorSubject<String>();
  final _replayStream = ReplaySubject<String>(maxSize: 4);

  get dartStream => _dartStream.stream.asBroadcastStream();
  get publishStream => _publishStream.stream;
  get behaviorStream => _behaviorStream.stream;
  get replayStream => _replayStream.stream.map((l) => _replayStream.values.join('\n'));

  startReading() async {
    var content = await File('/Users/mukhammadjonyorkinov/AndroidStudioProjects/rxdart_demo/rxdart_demo/assets/sonet.txt')
        .openRead().transform(utf8.decoder).transform(LineSplitter()).toList();

    for(String l in content){
      print(l);

      _dartStream.add(l);
      _publishStream.add(l);
      _behaviorStream.add(l);
      _replayStream.add(l);


      await Future.delayed(Duration(milliseconds: 4500));
    }


  }


  dispose(){
    _dartStream.close();
    _publishStream.close();
    _behaviorStream.close();
    _replayStream.close();
  }


}