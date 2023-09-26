import 'package:flutter/material.dart';

class LayoutDesktop extends StatefulWidget {
  const LayoutDesktop({super.key});

  @override
  State<LayoutDesktop> createState() => _StateLayoutDesktop();
}

class _StateLayoutDesktop extends State<LayoutDesktop> {
  _StateLayoutDesktop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text("Nintendo DB")),
      ),
      body: const Text("Desktop"),
    );
  }
}
