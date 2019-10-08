import 'package:flutter/material.dart';
import 'package:flutter_app/pages/discovery_page.dart';
import 'package:flutter_app/pages/news_list_page.dart';
import 'package:flutter_app/pages/profile_page.dart';
import 'package:flutter_app/pages/tweets_page.dart';
import 'package:flutter_app/widgets/my_drawer.dart';
import 'constants/constants.dart' show AppColors;
import 'widgets/navigation_icon_text_view.dart';
import 'widgets/my_drawer.dart';

main(List<String> args) => runApp(MaterialApp(
  title: '开源中国',
  home: HomePage(),
  theme: ThemeData(
    primaryColor: Color(AppColors.APP_THEME),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: Color(AppColors.APPBAR),
          fontSize: 20.0
        ),
      ),
      iconTheme: IconThemeData(
        color: Color(AppColors.APPBAR)
      )
    )
  ),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pages = <Widget>[
    NewsListPage(),
    TweetsPage(),
    DiscoveryPage(),
    ProfilePage()
  ];
  static List<String> _appTitles = ['资讯','动弹','发现','我的'];
  List<NavigationIconTextView> _navigationIconTextViews;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationIconTextViews = <NavigationIconTextView>[
      NavigationIconTextView(
        title: _appTitles[0],
        iconPath: 'images/ic_nav_news_normal.png',
        activeIconPath: 'images/ic_nav_news_actived.png'
      ),
       NavigationIconTextView(
        title: _appTitles[1],
        iconPath: 'images/ic_nav_tweet_normal.png',
        activeIconPath: 'images/ic_nav_tweet_actived.png'
      ),
       NavigationIconTextView(
        title: _appTitles[2],
        iconPath: 'images/ic_nav_discover_normal.png',
        activeIconPath: 'images/ic_nav_discover_actived.png'
      ),
       NavigationIconTextView(
        title: _appTitles[3],
        iconPath: 'images/ic_nav_my_normal.png',
        activeIconPath: 'images/ic_nav_my_pressed.png'
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitles[_currentIndex]),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationIconTextViews.map((view)=>view.item).toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: MyDraw(
        haadPicPath: 'images/cover_img.jpg',
        menuIcons: <IconData>[Icons.send,Icons.home,Icons.error,Icons.settings],
        menuTitles: <String>['发布动弹','动弹小黑屋','关于','设置'],
      ),
    );
  }
}