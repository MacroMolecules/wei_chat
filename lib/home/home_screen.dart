import 'package:flutter/material.dart';

import '../constants.dart' show Constants, AppColors;

// 枚举的方式
enum ActionItems {
  GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP
}

// 主页 顶部底部状态栏

class NavigationIconView {
  // final String _title;
  // final IconData _icon;  // 图标
  // final IconData _activeIcon;  // 点击切换图标
  final BottomNavigationBarItem item;  // 暴露的

  // 构造函数
  // 下划线_ 定义变量
  NavigationIconView({Key key,  String title, IconData icon, IconData activeIcon,}) :
    // 对全局变量赋值
    // _title = title,
    // _icon = icon,
    // _activeIcon = activeIcon,

    // 构造器数据结构
    item = BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      title: Text(title),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
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
          0xe634,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe65f,
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

  // 构建弹出菜单布局
  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
          iconName,
          fontFamily: Constants.IconFontFamily, // 添加图标
        ),
        size: 22.0,
        color: const Color(AppColors.AppBarPopuMenuTextColor)),  // 不可变的值前可用const修饰
        Container(width: 12.0),
        Text(title, style: TextStyle(color: const Color(AppColors.AppBarPopuMenuTextColor))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,  // 底部切换
      type: BottomNavigationBarType.fixed,
      // 回调函数 切换底部状态栏时 回调方法
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      }
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0,  // 去除顶部栏下的阴影
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(
              0xe60f,
              fontFamily: Constants.IconFontFamily, // 搜索图标
            ), size:22.0),
            onPressed: () {},
          ),
          Container(width: 4.0), // 添加间距
          // 添加按钮点击弹窗
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe665, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe638, "添加朋友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe602, "扫描维码"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe6a0, "收款付款"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe9b9, "帮助反馈"),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(IconData(
              0xe605,
              fontFamily: Constants.IconFontFamily, // 添加图标
            ), size:22.0),
            onSelected: (ActionItems selected) {},  // 点击事件
          ),
          Container(width: 8.0),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: botNavBar, // 传入参数
    );
  }
}