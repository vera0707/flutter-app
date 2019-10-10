// 用来保存一些经常用到的常量
abstract class AppColors{
  // 应用的主题相关
  static const APP_THEME = 0xff63ca6c;
  static const APPBAR = 0xffffffff;
} 

// 应用的信息
abstract class AppInfo{
  static const String CLIENT_ID  = 'Pc7LLY8GoswPbs4LLjMt';
  static const String CLIENT_SECRET = '4DYEmReugpiorHdnZrZOFrA0MP1gzVdF';
  static const String REDIRECT_URI = 'http://www.xieyuxuan.cc';
}

// 接口信息
abstract class AppUrls{
  // host
  static const String HOST = 'https://www.oschina.net';

  // 授权登录
  static const String OAUTH2_AUTHORIZE = HOST + '/action/oauth2/authorize';
  static const String OAUTH2_TOKEN = HOST + '/action/openapi/token';

  // 用户信息
  static const String OPENAPI_USER = HOST + '/action/openapi/user';
}