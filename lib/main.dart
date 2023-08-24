import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/button.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Turn off for release mode
      builder: (context) => const MyHome(), // Wrap your app
    ),
  );
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Note',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const MyApp(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // URLを開くメソッド
  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.brown,
        title: const Text(
          'App Shelf',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '注文受け取り',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Button(
                    width: double.infinity,
                    title: 'コーヒー',
                    onPressed: () {
                      _launchURL('https://coffee-order-8a3a3.web.app/#/');
                    },
                    disable: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    width: double.infinity,
                    title: '料理',
                    onPressed: () {
                      _launchURL('https://simple-lunch-dda25.web.app/#/');
                    },
                    disable: false,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'ゲーム',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Button(
                    width: double.infinity,
                    title: 'Tetris',
                    onPressed: () {
                      _launchURL('https://shinnkura.github.io/tetris/#/');
                    },
                    disable: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    width: double.infinity,
                    title: 'Tetris2',
                    onPressed: () {
                      _launchURL('https://shinnkura.github.io/block_puzzle/#/');
                    },
                    disable: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    width: double.infinity,
                    title: 'BlackJack',
                    onPressed: () {
                      _launchURL(
                          'https://shinnkura.github.io/blackjack_app/#/');
                    },
                    disable: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
