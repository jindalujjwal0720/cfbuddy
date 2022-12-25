import 'package:flutter/material.dart';

class HomeBottomNavigationWidget extends StatefulWidget {
  final List<Widget> children;
  const HomeBottomNavigationWidget(this.children, {super.key});

  @override
  State<HomeBottomNavigationWidget> createState() =>
      _HomeBottomNavigationWidgetState();
}

class _HomeBottomNavigationWidgetState
    extends State<HomeBottomNavigationWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widget.children,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
              tooltip: "Home tab"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.question_mark_rounded,
              ),
              label: "Problems",
              tooltip: "Problems tab"),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
