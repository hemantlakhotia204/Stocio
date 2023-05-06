import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:stocio_app/common/store/shared_preference_repo.dart';
import 'package:stocio_app/common/utils/common_utils.dart';
import 'package:stocio_app/common/widgets/s_appbar.dart';

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
      case 1:
      case 2:
        return const SAppbar();
      case 3:
        return SAppbar(
          title: 'Profile',
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await SharedPrefRepo.remove("at");
                  if (!mounted) return;
                  await Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        );
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
          Center(child: Text('Users')),
          Center(child: Text('Messages')),
          Center(child: Text('Settings')),
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
              icon: const Icon(Icons.event_rounded),
              title: const Text('Events'),
              activeColor: Utils.color('pb'),
              inactiveColor: Utils.color('sb')),
          BottomNavyBarItem(
              icon: const Icon(Icons.forum_rounded),
              title: const Text('Forum'),
              activeColor: Utils.color('pb'),
              inactiveColor: Utils.color('sb')),
          BottomNavyBarItem(
              icon: const Icon(Icons.person_rounded),
              title: const Text('Profile'),
              activeColor: Utils.color('pb'),
              inactiveColor: Utils.color('sb')),
        ],
      ),
    );
  }
}
