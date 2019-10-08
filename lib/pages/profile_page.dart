import 'package:flutter/material.dart';
import '../constants/constants.dart' show AppColors;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   final List<String> menuTitle = <String>[
    '我的消息',
    '我的记录',
    '我的博客',
    '我的问答',
    '我的活动',
    '我的团队',
    '邀请好友',
  ];

  final List<IconData> menuIcons = <IconData>[
    Icons.message,
    Icons.message,
    Icons.message,
    Icons.message,
    Icons.message,
    Icons.message,
    Icons.message,
  ];

  String _userAvatar;
  String _userName;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: menuTitle.length+1,
      itemBuilder: (context,index){
        if(index == 0){
          return Container(
            child: _buildHeader(),
          );
        }
        index -= 1;
        return ListTile(
          leading: Icon(menuIcons[index]),
          title: Text(menuTitle[index]),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){
            print('点击跳转$index');
            switch(index){
              case 0: break;
            }
          },
        );
      },
      separatorBuilder: (context,index)=> index == 0 ? Divider(height: 0,):Divider(),
    );
  }

  Container _buildHeader(){
    return Container(
      height: 150.0,
      color: Color(AppColors.APP_THEME),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                print('点击登录');
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0
                  ),
                  image: DecorationImage(
                    image: AssetImage('images/ic_avatar_default.png',),
                    fit: BoxFit.fill,
                  )
                ),
              ),
            ),
            Text(_userName ?? '点击头像登录',style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}