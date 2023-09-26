import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'layout_mobile_screen_2.dart';

class LayoutMobileScreen1 extends StatefulWidget {
  final String seccio;
  const LayoutMobileScreen1({Key? key, required this.seccio}) : super(key: key);
  @override
  State<LayoutMobileScreen1> createState() => _StateLayoutMobileScreen1();
}

class _StateLayoutMobileScreen1 extends State<LayoutMobileScreen1> {
  _StateLayoutMobileScreen1();

  void _navigateTo(BuildContext context, String value, int index) {
    Navigator.of(context).push(_customPageRoute(LayoutMobileScreen2(
      seccio: value,
      index: index,
    )));
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

  Widget _setBody(BuildContext context) {
    AppData _appData = Provider.of<AppData>(context);

    if (!_appData.dataReady(widget.seccio)) {
      _appData.load(widget.seccio);
      return const Center(child: CircularProgressIndicator());
    } else {
      var data = _appData.getData(widget.seccio);
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(data[index]['nom']),
            leading: Image.asset(
              'assets/images/${data[index]["imatge"]}',
              height: 50.0,
              width: 50.0,
              fit: BoxFit.contain,
            ),
            onTap: () => _navigateTo(context, widget.seccio, index),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.seccio), // Fent servir seccio com a títol
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: _setBody(context));
  }
}
