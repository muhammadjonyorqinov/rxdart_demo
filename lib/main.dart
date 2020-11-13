import 'package:flutter/material.dart';
import 'package:flutter_appcenter_bundle/flutter_appcenter_bundle.dart';
import 'package:provider/provider.dart';
import 'package:rxdart_demo/blocs/reader_bloc.dart';
import 'package:rxdart_demo/launch.dart';

void main() {
  appCenter();
  runApp(MyApp());
}
Future<void> appCenter() async {
  await AppCenter.startAsync(
    appSecretAndroid: "8936de53-072d-4208-92a9-66c8ef1a4208", //YOUR android APPSECRET CODE
    appSecretIOS: "1f1d7790-69cf-409d-8bd2-2cfad023a4ad", //YOUR iOS APPSECRET CODE
    enableAnalytics: true,
    // Defaults to true
    enableCrashes: true,
    // Defaults to true
    enableDistribute: true,
    // Defaults to false
    usePrivateDistributeTrack: false,
    // Defaults to false
    disableAutomaticCheckForUpdate: false, // Defaults to false
  );

  await AppCenter.configureDistributeDebugAsync(enabled: false);
  await AppCenter.configureAnalyticsAsync(enabled: true);
  await AppCenter.configureCrashesAsync(enabled: true);
  await AppCenter.configureDistributeAsync(enabled: true);
  await AppCenter.configureDistributeDebugAsync(enabled: true);
  // Android Only
  await AppCenter.checkForUpdateAsync(); // Manually check for update
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context)=>ReaderBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Launch(),
      ),
    );
  }
}

