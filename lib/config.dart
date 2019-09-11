class RouterConfig {
// route
  String account = '/account';
  String index = '/index';
  String about = "/about";
  String settings = "/settings";
  String language = '/language';
  String deviceInfo = 'deviceInfo';
}

class AppConfig {
  double appBarHeight = 48;


  String avatar = 'assets/images/avatar.png';
  String defaultAvatar = 'assets/images/default_avatar.png';
  String splash = 'assets/images/splash.png';
  String accountBg = 'assets/images/accountBg.jpg';

  // twitter
  String twitterApiKey =
      '3398211287-Bhgnx4cEwXEaRL8S7Z3cWE4lmqWvzylqkYd5Sm7';
  String twitterApiSecret =
      '7ig505pCyMk2BxDuHASwoOyCJ39EBpAY5AXg206xlbJSN';

  // github
  String githubClientId = '4cd0c308ae1050806a2c';
  String githubClientSecret =
      '42b3c750a3585cb22e05768abc275e9e75ecfca8';

  get weChatAppId => "wxd930ea5d5a258f4f";
}
