import 'package:flutter/material.dart';

import 'package:sym_mvvm_clone/ui/component/s_button.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';

import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const SText(
          text: 'hi',
          type: TextType.header1,
          color: SColor.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SButton(
              state: ButtonState.standard,
              onCilcked: () {},
              text: '완료',
            ),
            const SizedBox(
              height: 10,
            ),
            const SButton(
              state: ButtonState.disabled,
              text: '완료',
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
