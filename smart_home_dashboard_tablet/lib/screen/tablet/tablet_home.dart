import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';
import 'package:smart_home_dashboard_tablet/screen/tablet/tablet_appbar.dart';
import 'package:smart_home_dashboard_tablet/screen/tablet/tablet_center.dart';

class TabletHome extends StatefulWidget {
  const TabletHome({super.key});

  @override
  State<TabletHome> createState() => _TabletHomeState();
}

class _TabletHomeState extends State<TabletHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: M3Padding.small(
          child: Row(
            children: [
              TabletAppBar(),
              Expanded(flex: 5, child: TabletCenter()),
              Expanded(
                flex: 2,
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
