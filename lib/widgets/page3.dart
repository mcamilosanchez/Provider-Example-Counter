import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter_provider.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() {
    return _Page3();
  }
}

class _Page3 extends State<Page3> {
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
