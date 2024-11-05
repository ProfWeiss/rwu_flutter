import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Funky Pets'),
        ),
        body: CardsGrid(),
      ),
    );
  }
}

class CardsGrid extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "image": "assets/images/francis.jpg",
      "name": "Francis Flauschmann",
      "info": "Francis isst am liebsten Löwenzahn",
      "clickableText": "Haseninfo"
    },
    {
      "image": "assets/images/safira.jpg",
      "name": "Safira Schimmermann",
      "info": "Safira isst am liebsten Pastinake",
      "clickableText": "Haseninfo"
    },
    {
      "image": "assets/images/fritzi.jpg",
      "name": "Fritzi Flitzinger",
      "info": "Fritzi isst am liebsten Kohlrabiblatt",
      "clickableText": "Haseninfo"
    },
    {
      "image": "assets/images/francis2.jpg",
      "name": "Francis Flauschmann",
      "info": "Francis isst auch gerne grünen Blattsalat.",
      "clickableText": "Haseninfo"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 1.7,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CardWidget(
          imagePath: items[index]["image"] ?? "",
          name: items[index]["name"] ?? "",
          info: items[index]["info"] ?? "",
          clickableText: items[index]["clickableText"] ?? "",
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String info;
  final String clickableText;

  const CardWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.info,
    required this.clickableText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(imagePath, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => _showModal(context, info),
              child: Text(
                clickableText,
                style: const TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showModal(BuildContext context, String text) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(text),
        );
      },
    );
  }
}
