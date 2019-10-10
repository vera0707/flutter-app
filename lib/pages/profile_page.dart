import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_util.dart';
import 'package:flutter_app/utils/net_util.dart';
import '../constants/constants.dart' show AppColors,AppUrls;
import 'package:flutter_app/pages/login_web_page.dart';
import '../common/event_bus.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();

    // 尝试显示用户信息
    eventBus.on<LoginEvent>().listen((event){
      // 获取用户信息
      _getUserInfo();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: menuTitle.length+1,
      itemBuilder: (context,index){
        if(index == 0){
          return _buildHeader();
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
                DataUtil.isLogin().then((isLogin){
                  if(isLogin){
                    print('跳转进详情页');
                  }else{
                    _login();
                  } 
                });
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
                    image: _userName == null ? AssetImage('images/ic_avatar_default.png',) : NetworkImage(_userAvatar),
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

  _login() async{
    Navigator.push(context,MaterialPageRoute(
      builder: (context)=> LoginWebPage(),
    )).then((value){
      if(value == 'refresh'){
        print('登录成功');
        eventBus.fire(LoginEvent());
      }
    });
  }

  _getUserInfo() async{
    DataUtil.getAccessToken().then((token){
      if(token == null && token.length == 0) return;
      Map<String,dynamic> params = Map<String,dynamic>();
      params['access_token'] = token;
      params['dataType'] = 'json';
      NetUtil.get(AppUrls.OPENAPI_USER, params).then((data){
        print(data);
        if(mounted){
          setState(() {
            _userAvatar = data['avatar'];
            _userName = data['name'];
          });
        }

        DataUtil.saveUser(data).then((user){
          print(user.name);
          print(user.avatar);
        });
      });
    });
  }
}