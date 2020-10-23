import 'package:flutter/material.dart';
import 'package:flutter_git/manage/manage_local.dart';
import 'package:flutter_git/manage/manage_shared.dart';
import 'package:flutter_git/utils/utils_gmAvatar.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //移除顶部padding
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(), //构建抽屉菜单头部
            Expanded(child: _buildMenus()), //构建功能菜单
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserShared>(
      builder: (BuildContext context, UserShared value, Widget child) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                    // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                    child: value.isLogin
                        ? gmAvatar(value.user.avatar_url, width: 80)
                        : Image.network(
                      'https://live.csdn.net/room/Hansen666666/6gbp7yLj?utm_source=248541953',
                      width: 80,
                    ),
                  ),
                ),
                Text(
                  value.isLogin
                      ? value.user.login
                      : LocalManage.of(context).login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            if (!value.isLogin) Navigator.of(context).pushNamed("login");
          },
        );
      },
    );
  }

  // 构建菜单项
  Widget _buildMenus() {
    return Consumer<UserShared>(
      builder: (BuildContext context, UserShared userModel, Widget child) {
        var gm = LocalManage.of(context);
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text('主题'),
              onTap: () => Navigator.pushNamed(context, "themes"),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text('语言'),
              onTap: () => Navigator.pushNamed(context, "language"),
            ),
            if(userModel.isLogin) ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: Text('退出'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    //退出账号前先弹二次确认窗
                    return AlertDialog(
                      content: Text('确定登出？'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('关闭'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                          child: Text('去确认'),
                          onPressed: () {
                            //该赋值语句会触发MaterialApp rebuild
                            userModel.user = null;
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}