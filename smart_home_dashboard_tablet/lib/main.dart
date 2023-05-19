import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';
import 'package:smart_home_dashboard_tablet/my_app.dart';

void main() {
  runApp(const App());
}
// https://cdn.dribbble.com/users/6259454/screenshots/16785507/media/82aa1573e2451d300d0b1e415b57af91.png
// https://dribbble.com/shots/15784670-Smart-Home-App/attachments/7593078?mode=media
class App extends StatelessWidget {
  final m3BaseColors = const Color(0xFF40C0FE);
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return M3ThemeProvider(
        m3ThemeManager: M3ThemeManager(m3BaseColors: m3BaseColors),
        m3Builder: (context, themeData, darkTheme, themeMode) => MaterialApp(
            title: 'Flutter M3 Core',
            theme: themeData,
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: const MyApp()));
  }
}
