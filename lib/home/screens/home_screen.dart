import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:stocio_app/common/utils/common_utils.dart';
import 'package:stocio_app/common/widgets/s_appbar.dart';
import 'package:stocio_app/home/screens/views/event_sceen.dart';
import 'package:stocio_app/home/screens/views/org_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0, keepPage: true);

  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _appBar() {
    switch (_selectedIndex) {
      case 0:
        return SAppbar(
          title: 'Welcome,',
          actions: [
            IconButton(onPressed: () => Navigator.pushNamed(context, '/profile'), icon: const Icon(Icons.person_rounded)),
          ],
        );
      case 1:
        return SAppbar(
          title: '',
          actions: [
            IconButton(onPressed: () => Navigator.pushNamed(context, '/profile'), icon: const Icon(Icons.person_rounded)),
          ],
        );
      case 2:
        return SAppbar(
          title: '',
          actions: [
            IconButton(onPressed: () => Navigator.pushNamed(context, '/profile'), icon: const Icon(Icons.person_rounded)),
          ],
        );
      case 3:
        return const SAppbar();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.color('pbg'),
      appBar: _appBar(),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: _pageController,
        children: const [
          Center(child: Text('Dashboard')),
          OrgScreen(),
          EventScreen(),
          Center(child: Text('Messages')),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.jumpToPage(index);
          // _pageController.animateToPage(index, duration: const Duration(milliseconds: 270), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
              icon: const Icon(Icons.apps_rounded),
              title: const Text('Dashboard'),
              activeColor: Utils.color('pb'),
              inactiveColor: Utils.color('sb')),
          BottomNavyBarItem(
              icon: const Icon(Icons.people_rounded),
              title: const Text('Organizations'),
              activeColor: Utils.color('pb'),
              inactiveColor: Utils.color('sb')),
          BottomNavyBarItem(
              icon: const Icon(Icons.event_rounded),
              title: const Text('Events'),
              activeColor: Utils.color('pb'),
              inactiveColor: Utils.color('sb')),
          BottomNavyBarItem(
              icon: const Icon(Icons.forum_rounded),
              title: const Text('Forum'),
              activeColor: Utils.color('pb'),
              inactiveColor: Utils.color('sb')),
        ],
      ),
    );
  }
}
