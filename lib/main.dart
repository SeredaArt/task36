// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final items = [
    "assets/images/1801287.svg",
    "https://raw.githubusercontent.com/dnfield/flutter_svg/7d374d7107561cbd906d7c0ca26fef02cc01e7c8/example/assets/flutter_logo.svg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: CarouselSlider.builder(
          itemCount: items.length,
          options: CarouselOptions(
            height: 300.0,
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            padding: const EdgeInsets.all(100.0),
            child: returnImage(items[itemIndex]),
          ),
        ));
  }

  SvgPicture returnImage(String name) {
    if (name.contains('http')) {
      return SvgPicture.network(
        name,
      );
    } else {
      return SvgPicture.asset(name);
    }
  }
}
