import 'package:flutter/material.dart';
import '../pages/mainpage.dart';
import '../pages/postpage.dart';
import '../pages/toolspage.dart';

class IndexRoute extends StatefulWidget {
  IndexRoute({Key key}): super(key: key);
  @override
  _IndexRouteState createState() => _IndexRouteState();
}

class _IndexRouteState extends State<IndexRoute> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    MainPage(),
    PostPage(),
    ToolsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: Container(
        child: Container(margin: EdgeInsets.fromLTRB(0, kToolbarHeight/2, 0, 10),
        child: Row(children: [
          FlatButton(
            onPressed: null, 
            child: Image.network('https://www.xeus.com/wp-content/uploads/2014/09/One_User_Orange.png', width: 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          )
        ],),
        ),
        color: Theme.of(context).accentColor,
      ), preferredSize: Size(double.infinity, kToolbarHeight)),
      body: PageStorage(bucket: PageStorageBucket(), child: _pages[selectedIndex],),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: 'new'),
      BottomNavigationBarItem(icon: Icon(Icons.construction), label: 'tools')
    ], currentIndex: selectedIndex, selectedItemColor: Theme.of(context).primaryColor, onTap: _onTab,),
    
    );
  }

  void _onTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}