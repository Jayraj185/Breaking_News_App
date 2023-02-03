import 'package:flutter/material.dart';
import 'package:news_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: homeProviderTrue!.Screens[homeProviderTrue!.index2],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeProviderTrue!.index2,
          selectedItemColor: Color(0xFFFF3A44),
          unselectedItemColor: Colors.red.shade200,
          onTap: (value) {
            homeProviderFalse!.ChnageIndex2(value);
          },
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: "Today's News"),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ],
        ),
      ),
    );
  }
}
