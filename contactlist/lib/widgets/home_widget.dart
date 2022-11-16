import 'package:contactlist/providers/contact_provider.dart';
import 'package:contactlist/widgets/favorite_widge.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    // TODO: implement initState
    getContact();
  }

  getContact() async => await context.read<ProviderContact>().fetchContact();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const Gap(20),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        const Gap(20),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const FavoriteWidget();
                    })));
                  },
                  leading: Image.asset(
                    'assets/images/user.png',
                    height: 35,
                  ),
                  title: const Text(
                    'Blossom Kim',
                    style: TextStyle(fontSize: 10),
                  ),
                  subtitle: const Text('+234 706 691 5138'),
                  trailing: const Icon(Icons.favorite),
                  // trailing: DropdownButton(items: [
                  //   DropdownMenuItem(
                  //     child: const Text('view contacts'),
                  //   ),
                  //   DropdownMenuItem(
                  //     child: const Text('favorite'),
                  //   )
                  // ], onChanged: (value) {}),
                );
              }),
        )
      ],
    ));
  }
}
