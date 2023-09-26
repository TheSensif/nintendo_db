import 'package:flutter/material.dart';

class LayoutConsoles extends StatelessWidget {
  final dynamic itemData;

  final Map<String, Color> colorMap = {
    'red': Colors.red,
    'blue': Colors.blue,
    'green': Colors.green,
    'orange': Colors.orange,
    'brown': Colors.brown,
    'grey': Colors.grey,
    'pink': Colors.pink,
    'yellow': Colors.yellow,
    'purple': Colors.purple,
    'black': Colors.black,
    'white': Colors.white
  };

  LayoutConsoles({Key? key, required this.itemData}) : super(key: key);

  Color getColorFromString(String colorString) {
    return colorMap[colorString.toLowerCase()] ?? Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 100.0,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            'assets/images/${itemData["imatge"]}',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${itemData['nom']}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                width: 10,
                height: 10,
                color: getColorFromString(itemData['color']),
              ),
              const SizedBox(height: 10),
              Text(
                "${itemData['data']}",
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                "${itemData['procesador']}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${itemData['venudes']} venudes"),
            ],
          ),
        )
      ]),
    );
  }
}
