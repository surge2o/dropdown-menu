import 'package:contactlist/widgets/favorite_widge.dart';
import 'package:contactlist/widgets/home_widget.dart';
import 'package:contactlist/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> widgetOption = [
    const HomeWidget(),
    const FavoriteWidget(),
    const ProfileWidget()
  ];

  setindex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOption[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setindex(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
          ]),
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
