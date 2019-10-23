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

///
///  ///android+ios app id;
//    this.androidBannerIdList = ["ca-app-pub-3940256099942544/6300978111"];
//
//    ///android banner id
//    this.iosBannerIdList = ["ca-app-pub-3940256099942544/2934735716"];
//
//    ///Interstitial id
//    this.androidInterstitialIdList = ["ca-app-pub-3940256099942544/1033173712"];
//    this.iosInterstitialIdList = ["ca-app-pub-3940256099942544/4411468910"];
//
//    ///Reward Video
//    this.androidRewardBasedVideoIdList = [
//      "ca-app-pub-3940256099942544/5224354917"
//    ];
//    this.iosRewardBasedVideoIdList = ["ca-app-pub-3940256099942544/1712485313"];

class _MyHomePageState extends State<MyHomePage> with AdmobUtils {
  @override
  void initState() {
    super.initState();
    initAdmobIds(
      appIdList: [
        "ca-app-pub-3940256099942544~3347511713",
        "ca-app-pub-3940256099942544~1458002511"
      ],
      androidBannerIdList:["ca-app-pub-3940256099942544/1033173712"],
      iosBannerIdList:["ca-app-pub-3940256099942544/2934735716"],
      androidInterstitialIdList:["ca-app-pub-3940256099942544/1033173712"],
      iosInterstitialIdList:["ca-app-pub-3940256099942544/4411468910"],
      androidRewardBasedVideoIdList:["ca-app-pub-3940256099942544/5224354917"],
      iosRewardBasedVideoIdList:["ca-app-pub-3940256099942544/1712485313"]
    );
    initData((AdmobAdEvent event, Map<String, dynamic> args, AdTypeEnum adType) {
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
