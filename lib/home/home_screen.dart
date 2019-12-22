import 'package:flutter/material.dart';

// 主页 底部状态栏

class NavigationIconView {
  final String _title;
  final Widget _icon;  // 图标
  final Widget _activeIcon;  // 点击切换图标
  final BottomNavigationBarItem item;  // 暴露的

  // 构造函数
  // 下划线_ 定义变量
  NavigationIconView({Key key,  String title, Widget icon, Widget activeIcon,}) :
    // 对全局变量赋值
    _title = title,
    _icon = icon,
    _activeIcon = activeIcon,

    // 构造器数据结构
    item = BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      title: Text(title),
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
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm)
      ),
      NavigationIconView(
        title: '通讯录',
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm)
      ),
      NavigationIconView(
        title: '发现',
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm)
      ),
      NavigationIconView(
        title: '我',
        icon: Icon(Icons.portrait),
        activeIcon: Icon(Icons.access_alarm)
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