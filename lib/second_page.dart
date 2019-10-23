import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lib_admob/admob/ad_type_enum.dart';
import 'package:flutter_lib_admob/admob/admob_utils.dart';
import 'package:flutter_lib_admob/flutter_lib_admob.dart';

class SecondPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> with AdmobUtils{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            showBannerAd(
                callback: (AdmobAdEvent event, Map<String, dynamic> args,AdTypeEnum adType) {}),
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