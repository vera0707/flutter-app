import 'package:flutter/material.dart';
import 'package:flutter_app/pages/about_page.dart';
import 'package:flutter_app/pages/publish_tweet_page.dart';
import 'package:flutter_app/pages/setting_page.dart';
import 'package:flutter_app/pages/tweet_dart_house_page.dart';

class MyDraw extends StatelessWidget {

  final String haadPicPath;
  final List<String> menuTitles;
  final List<IconData> menuIcons;

  MyDraw({
    Key key,
    @required this.haadPicPath,
    @required this.menuTitles,
    @required this.menuIcons  
  }):assert(haadPicPath != null),
  assert(menuTitles != null),
  assert(menuIcons != null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        padding: EdgeInsets.all(0.0),
        itemCount: menuTitles.length+1,
        itemBuilder: (context,index){
          if(index == 0){
            return Image.asset(haadPicPath,fit: BoxFit.fill);
          }
          index -=1;
          return ListTile(
              leading: Icon(menuIcons[index]),
              title: Text(menuTitles[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                switch(index){
                  case 0: _navPush(context,PublishTweetPage());break;
                  case 1: _navPush(context,TweetDartHousePage());break;
                  case 2: _navPush(context,AboutPage());break;
                  case 3: _navPush(context,SettingPage());break;
                }
              },
          );
        },
        separatorBuilder: (context,index)=> index == 0 ? Divider(height: 0): Divider(),
      ),
    );
  }
}

void _navPush(BuildContext context,Widget page){
  Navigator.push(context, MaterialPageRoute(
    builder: (context)=>page,
  ));
}