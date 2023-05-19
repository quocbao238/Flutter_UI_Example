import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';
import 'package:smart_home_dashboard_tablet/screen/tablet/tablet_home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const M3ViewLayout(tablet: TabletHome());
  }
}
