import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './category_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meals> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //Two ways to have tabs
  //First way, top tab bar with default tab controller
  //enclosing scaffold as child
  //Use below code in build
  /*DefaultTabController(length: 2, child: Scaffold(
  appBar: AppBar(title: Text("Meals"),
  bottom: TabBar(
  tabs: [
  Tab(icon: Icon(Icons.category),text: "Categories",),
  Tab(icon: Icon(Icons.star),text: "Favorites",)
  ],
  ),),
  body: TabBarView(
  children: [
  CategoryScreen(),
  FavoritesScreen()
  ],
  ),
  ));*/

  //The second method is for bottom tab bar
  //We will use this one for this app


  List<Map<String, Object>> _pages;

  int _selectedPageIndex=0;

  void _selectPage(int index)
  {
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  void initState() {
    _pages=[
      {"page":CategoryScreen(),"title":"Categories"},
      {"page":FavoritesScreen(widget.favoriteMeals),"title":"Your Favorites"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
