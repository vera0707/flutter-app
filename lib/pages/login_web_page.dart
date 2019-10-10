import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_util.dart';
import 'package:flutter_app/utils/net_util.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_app/constants/constants.dart' show AppUrls,AppInfo;

class LoginWebPage extends StatefulWidget {
  @override
  _LoginWebPageState createState() => _LoginWebPageState();
}

class _LoginWebPageState extends State<LoginWebPage> {
  FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();
  bool _isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听URl变化
    _flutterWebviewPlugin.onUrlChanged.listen((url){
      print(url);
      if(mounted){
        setState(() {
          _isLoading = true;
        });
      }

      if(url != null && url.length > 0 && url.contains('?code=')){
        // https://client.example.com/cb?code=SplxlOBeZQQYbYS6WxSbIA&state=xyz
        // 登录成功 提取授权码code
        String code = url.split('?')[1].split('&')[0].split('=')[1];

        // 拼接 params
        Map<String,dynamic> params = Map<String,dynamic>();
        params['client_id'] = AppInfo.CLIENT_ID;
        params['client_secret'] = AppInfo.CLIENT_SECRET;
        params['grant_type'] = "authorization_code";
        params['redirect_uri'] = AppInfo.REDIRECT_URI;
        params['code'] = code;
        params['dataType'] = "json";

        NetUtil.get(AppUrls.OAUTH2_TOKEN, params).then((data){
          if(data != null){
            DataUtil.saveLoginInfo(data);
            Navigator.pop(context,'refresh');
          }
        });

      }
      
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _flutterWebviewPlugin.close();
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return WebviewScaffold(
      url: AppUrls.OAUTH2_AUTHORIZE + '?response_type=code&client_id=' + AppInfo.CLIENT_ID + '&state=xyz&redirect_uri=' + AppInfo.REDIRECT_URI,
      appBar: AppBar(
        title: Row(
          children: _isLoading ? <Widget>[
            Text('登录中'),
            SizedBox(width: 10.0,),
            CupertinoActivityIndicator()
          ] : <Widget>[
            Text('加载成功')
          ],
        ),
      ),
      withJavascript: true,
      withLocalStorage: true,
      withZoom: true,
    );
  }
}