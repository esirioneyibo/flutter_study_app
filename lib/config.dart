class RouterConfig {
// route
  static const account = '/account';
  static const index = '/index';
  static const about = "/about";
  static const settings = "/settings";
  static String language = '/language';
  static String deviceInfo = 'deviceInfo';
}

class AppConfig {
  static const double appBarHeight = 48;
  static const double choiceIconSize = 30;

  static const avatar = 'assets/images/avatar.png';
  static const default_avatar =
      'assets/images/default_avatar.png';
  static const splash = 'assets/images/splash.png';
  static const accountBg = 'assets/images/accountBg.jpg';

  // twitter
  static const twitterApiKey =
      '3398211287-Bhgnx4cEwXEaRL8S7Z3cWE4lmqWvzylqkYd5Sm7';
  static const twitterApiSecret =
      '7ig505pCyMk2BxDuHASwoOyCJ39EBpAY5AXg206xlbJSN';

  // github
  static const GITHUB_CLIENT_ID = '4cd0c308ae1050806a2c';
  static const GITHUB_CLIENT_SECRET =
      '42b3c750a3585cb22e05768abc275e9e75ecfca8';

  static get weChatAppId => "wxd930ea5d5a258f4f";
}
