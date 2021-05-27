import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:airtv_clone/search_page.dart';
import 'package:airtv_clone/stream_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]).then((_){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AirTv Clone',
      debugShowCheckedModeBanner: true,
      theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController controller=PageController();
  List<Widget> _list=<Widget>[

    ChannelView(),
    SearchPage(),


  ];
  int _curr= 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _list,
        scrollDirection: Axis.horizontal,

        controller: controller,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        }
      ),
    );
  }
}


