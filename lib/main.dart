import 'package:flutter/material.dart';

import './constants.dart' show AppColors;
import './home/home_screen.dart';

// 主入口文件

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.AppBarColor),  // 全局主题
  ),
  home: HomeScreen(),
));
