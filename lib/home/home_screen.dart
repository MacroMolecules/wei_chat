import 'package:flutter/material.dart';

import '../constants.dart';

// 主页 底部状态栏

class NavigationIconView {
  final String _title;
  final IconData _icon;  // 图标
  final IconData _activeIcon;  // 点击切换图标
  final BottomNavigationBarItem item;  // 暴露的

  // 构造函数
  // 下划线_ 定义变量
  NavigationIconView({Key key,  String title, IconData icon, IconData activeIcon,}) :
    // 对全局变量赋值
    _title = title,
    _icon = icon,
    _activeIcon = activeIcon,

    // 构造器数据结构
    item = BottomNavigationBarItem(
      icon: Icon(icon, color: Color(AppColors.TabIconNormal)),
      activeIcon: Icon(activeIcon, color: Color(AppColors.TabIconActive)),
      title: Text(title, style: TextStyle(
        fontSize: 14.0,
        color: Color(AppColors.TabIconNormal)
      )),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe635,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '朋友',
        icon: IconData(
          0xe61a,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe63d,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe63c,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe65b,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '我的',
        icon: IconData(
          0xe65d,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe60d,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      // 回调函数 切换底部状态栏时 回调方法
      onTap: (int index) {
        print('点击第$index个Tab');
      }
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: botNavBar, // 传入参数
    );
  }
}