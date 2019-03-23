
import 'package:doc_willie_ong/about.dart';
import 'package:doc_willie_ong/favourites.dart';
import 'package:doc_willie_ong/videos.dart';
import 'package:doc_willie_ong/chat.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dr. Willie Ong",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dr. Willie Ong'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin  {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Videos', icon: Icon(Icons.featured_video),),
    Tab(text: 'Favourites', icon:Icon(Icons.favorite)),
    Tab(text: 'Chat', icon:Icon(Icons.chat)),
    Tab(text: 'About', icon: Icon(Icons.person),),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Image.asset('images/small.png'),
        title: Text(widget.title),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     tooltip: 'Search',
        //     onPressed: () {
        //       _tabController.animateTo(0);
        //     },
        //   ),
        // ],
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Videos(),
          Favourites(),
          Chat(),
          About(),
        ],
      ),
    );
  }
}
