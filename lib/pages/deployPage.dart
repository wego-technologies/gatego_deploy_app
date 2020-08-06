import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gategoDeploy/pages/confirmPage.dart';
import 'package:gategoDeploy/widget/bottomNavBar.dart';
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
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Image.asset(
              "assets/gatego.png",
              height: 30,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.sync,
              color: Color(0xff00a1d3),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "👍",
                style: TextStyle(fontSize: 80),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Awsome, now let's send over the WiFi connection details.",
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
