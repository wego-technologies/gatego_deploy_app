import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/confirmPage.dart';
import '../widget/bottomNavBar.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:wiredash/wiredash.dart';
import '../widget/SSIDInput.dart';

class DeployPage extends StatefulWidget {
  @override
  _DeployPageState createState() => _DeployPageState();
}

class _DeployPageState extends State<DeployPage> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        ConfirmPage(),
        backBtn: false,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottom: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            "Set wifi",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          ),
        ),
        title: Row(
          children: <Widget>[
            Image.asset(
              "assets/gatego.png",
              height: 30,
              alignment: Alignment.centerRight,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.sync,
              color: Color(0xff00a1d3),
            ),
            onPressed: () {
              Get.offUntil(MaterialPageRoute(builder: (_) {
                return DeployPage();
              }), (route) => false);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Color(0xff00a1d3),
            ),
            onPressed: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String appName = packageInfo.appName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;
              return showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset(
                    "assets/bicon.png",
                    width: 50,
                    height: 50,
                  ),
                  applicationName: appName + " by Wego Technologies",
                  applicationVersion: version + " - B" + buildNumber,
                  applicationLegalese:
                      "All rights reserved. Copyright 2020 Wego Technologies LLC. Doubts? Contact eduardo@wegotech.io");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.chat,
              color: Color(0xff00a1d3),
            ),
            onPressed: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;
              Wiredash.of(context).setBuildProperties(
                  buildVersion: version, buildNumber: buildNumber);
              Wiredash.of(context).show();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: FlareActor(
                  "assets/aio_indicator.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: "wait_wifi",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hey! Input your wifi credentials to set up your device.",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              SSIDInput(),
            ],
          ),
        ),
      ),
    );
  }
}
