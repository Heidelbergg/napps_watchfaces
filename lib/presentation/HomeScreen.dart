import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import "package:flutter/material.dart";
import 'package:wear_bridge/wear_bridge.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset("assets/watch.png", fit: BoxFit.contain,),
          ),
          Text("Neon Watch Face", style: TextStyle(fontSize: 24, color: Colors.grey.withOpacity(0.85), fontWeight: FontWeight.w700),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("This is a companion app only. Press the button below and see the watch face on your watch.", style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.85), fontWeight: FontWeight.w400),),
          ),
          const SizedBox(
            height: 50,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Connect Watch to phone'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text('Make sure that your Watch is connected to your phone before proceeding. Press next after you have connected your watch to your phone.'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Next'),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check the screen of your watch in order to install the watch face")));
                          const url = 'https://play.google.com/store/apps/details?id=com.NappS.NeonWatch';
                          WearBridge.openUrl(url);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all(3),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            child: const Text("Open on Watch", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
