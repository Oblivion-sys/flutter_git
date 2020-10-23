import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Locale资源类
class LocalManage {
  LocalManage(this.isZh);
  //是否为中文
  bool isZh = false;
  //为了使用方便，我们定义一个静态方法
  static LocalManage of(BuildContext context) {
    return Localizations.of<LocalManage>(context, LocalManage);
  }
  //Locale相关值，title为应用标题
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }

  String get home {
    return isZh ? "Flutter应用" : "Flutter APP";
  }

  String get login {
    return isZh ? "登录" : "Login";
  }
//... 其它的值
}

//Locale代理类
class LocalManageDelegate extends LocalizationsDelegate<LocalManage> {
  const LocalManageDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<LocalManage> load(Locale locale) {
    print("$locale");
    return SynchronousFuture<LocalManage>(
        LocalManage(locale.languageCode == "zh")
    );
  }

  @override
  bool shouldReload(LocalManageDelegate old) => false;
}