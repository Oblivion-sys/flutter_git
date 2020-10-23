import 'package:flutter/material.dart';
import 'package:flutter_git/manage/manage_global.dart';
import 'package:flutter_git/manage/manage_shared.dart';
import 'package:provider/provider.dart';

class ThemeChangeRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主题'),
      ),
      body: ListView( //显示主题色块
        children: GlobalManage.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              //主题更新后，MaterialApp会重新build
              Provider.of<ThemeShared>(context).theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}