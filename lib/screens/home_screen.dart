import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';
import 'package:provider_counter/widgets/page1.dart';
import 'package:provider_counter/widgets/page2.dart';
import 'package:provider_counter/widgets/page3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;
  final List<Widget> _pages = <Widget>[
    const Page1(),
    const Page2(),
    const Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
        actions: [
          TextButton(
            onPressed: null,
            child: Text(
              context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(color: Colors.purple),
            ),
          )
        ],
      ),
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }
}
