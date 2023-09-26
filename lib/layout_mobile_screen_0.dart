import 'package:flutter/material.dart';

import 'layout_mobile_screen_1.dart';

class LayoutMobilScreen0 extends StatefulWidget {
  const LayoutMobilScreen0({super.key});

  @override
  State<LayoutMobilScreen0> createState() => _StateLayoutMobilScreen0();
}

class _StateLayoutMobilScreen0 extends State<LayoutMobilScreen0> {
  _StateLayoutMobilScreen0();

  void _navigateTo(BuildContext context, String value) {
    Navigator.of(context)
        .push(_customPageRoute(LayoutMobileScreen1(seccio: value)));
  }

  PageRouteBuilder _customPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Animación desde la derecha
        const end = Offset.zero; // Hacia la posición original
        const curve = Curves.easeInOut; // Curva de animación
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text("Nintendo DB")),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text("Personatges"),
            onTap: () => _navigateTo(context, 'Personatges'),
          ),
          const Divider(height: 0),
          ListTile(
            title: const Text("Jocs"),
            onTap: () => _navigateTo(context, 'Jocs'),
          ),
          const Divider(height: 0),
          ListTile(
            title: const Text("Consoles"),
            onTap: () => _navigateTo(context, 'Consoles'),
          ),
        ],
      ),
    );
  }
}
