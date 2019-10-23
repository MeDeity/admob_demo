import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lib_admob/admob/ad_type_enum.dart';
import 'package:flutter_lib_admob/admob/admob_utils.dart';
import 'package:flutter_lib_admob/admob/generate_admob_id.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AdmobUtils {
  @override
  void initState() {
    super.initState();
    initTestData(
        (AdmobAdEvent event, Map<String, dynamic> args, AdTypeEnum adType) {
      print("${adType.index}");
    });
    GenerateAdmobId factory = getAdmobIdFactory();
    Admob.initialize(factory.getAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            showBannerAd(
            callback: (AdmobAdEvent event, Map<String, dynamic> args,
                AdTypeEnum adType) {}),
            FlatButton(
              child: Text("插页式", style: TextStyle(fontSize: 18)),
              onPressed: () {
                showInterstitialAd();
              },
            ),
            FlatButton(
              child: Text("奖励式", style: TextStyle(fontSize: 18)),
              onPressed: () {
                showRewardAd();
              },
            ),
          ],
        ),
      ),
    );
  }
}
