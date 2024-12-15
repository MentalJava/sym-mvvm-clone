import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sym_mvvm_clone/ui/component/s_button.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_text_field.dart';
import 'package:sym_mvvm_clone/ui/component/s_text_field_controller.dart';
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sTextFieldController = Get.put(STextFieldController());
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SButton(
              state: ButtonState.standard,
              onCilcked: () {},
              text: const SText(
                text: '완료',
                type: TextType.body1,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SButton(
              state: ButtonState.disabled,
              text: SText(
                text: '완료',
                type: TextType.body1,
                color: SColor.grey6,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            STextField(
              hintText: '닉네임을 입력해주세요',
              controller: sTextFieldController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
