import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() {
    return _Page2();
  }
}

class _Page2 extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<CounterProvider>().counter.toString(),
            style: const TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
