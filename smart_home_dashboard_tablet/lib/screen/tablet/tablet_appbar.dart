import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef AppMenuItem = (String title, IconData icon, int index);

final listPaletteColor = {
  'Red': Colors.red,
  'Pink': Colors.pink,
  'Purple': Colors.purple,
  'Deep Purple': Colors.deepPurple,
  'Indigo': Colors.indigo,
  'Blue': Colors.blue,
  'Light Blue': Colors.lightBlue,
  'Cyan': Colors.cyan,
  'Teal': Colors.teal,
  'Green': Colors.green,
  'Light Green': Colors.lightGreen,
  'Lime': Colors.lime,
  'Yellow': Colors.yellow,
  'Amber': Colors.amber,
  'Orange': Colors.orange,
  'Deep Orange': Colors.deepOrange,
  'Brown': Colors.brown,
  'Grey': Colors.grey,
  'Blue Grey': Colors.blueGrey,
};

class TabletAppBar extends StatefulWidget {
  const TabletAppBar({Key? key}) : super(key: key);

  @override
  State<TabletAppBar> createState() => _TabletAppBarState();
}

class _TabletAppBarState extends State<TabletAppBar> {
  final List<(String title, IconData icon, int index)> lstTitle = [
    ('Home', FontAwesomeIcons.home, 0),
    ('User', FontAwesomeIcons.user, 1),
    ('Setting', FontAwesomeIcons.cog, 2),
    ('Logout', FontAwesomeIcons.signOutAlt, 3),
  ];

  final List<(String title, IconData icon, int index)> lstTheme = [
    ('Dark', FontAwesomeIcons.moon, 0),
    ('Light', FontAwesomeIcons.sun, 1),
    ('Custom', FontAwesomeIcons.paintBrush, 2),
  ];

  int currentIndex = 0;
  int currentThemeIndex = 0;

  void _onPressedMenuIndex(int index) => setState(() => currentIndex = index);

  void _onPressedThemeIndex(BuildContext context, int index) {
    if (index == currentThemeIndex) return;
    if (index == 2) {
      showDialogPaletteColor(context);
      return;
    }
    M3ThemeProvider.toggleTheme(context);
    setState(() {
      currentThemeIndex = index;
    });
  }

  Future<void> showDialogPaletteColor(BuildContext buildContext) async {
    await showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(buildContext).size.width * 0.8,
          height: MediaQuery.of(buildContext).size.height * 0.65,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                    child: M3Text.titleMedium(
                      text: 'Change M3 Base Color',
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  M3Padding(
                    padding: const M3EdgeInsets.only(left: M3Spacing.small),
                    child: M3ButtonWithIcon.outline(
                        icon: Icons.close,
                        onPressed: () => Navigator.of(ctx).pop(),
                        text: 'Close'),
                  ),
                ],
              ),
              Expanded(
                child: M3Padding(
                  padding:
                      const M3EdgeInsets.symmetric(vertical: M3Spacing.medium),
                  child: OrientationBuilder(builder: (context, orientation) {
                    final int crossAxisCount =
                        orientation == Orientation.portrait ? 4 : 10;

                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      children: listPaletteColor.entries
                          .map(
                            (e) => M3Button(
                                text: '',
                                backgroundColor: e.value,
                                onPressed: () => M3ThemeProvider.changeM3Color(
                                    buildContext, e.value)),
                          )
                          .toList(),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kToolbarHeight * 1.5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
                'https://gitlab.com/uploads/-/system/user/avatar/56386/tt_avatar_small.jpg',
                width: kToolbarHeight,
                height: kToolbarHeight,
                fit: BoxFit.fill),
          ),
          const M3Padding(
            padding: M3EdgeInsets.symmetric(vertical: M3Spacing.small),
            child: M3Text.bodyLarge(
                text: 'Mr.Vitaliy', fontWeight: FontWeight.bold),
          ),
          M3Padding(
            padding:
                const M3EdgeInsets.symmetric(vertical: M3Spacing.veryLarge),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...lstTitle.map(
                    (AppMenuItem e) => CustomAppBarItem(
                      currentIndex: currentIndex,
                      item: e,
                      onPressed: () => _onPressedMenuIndex(e.$3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          M3Padding(
            padding: const M3EdgeInsets.symmetric(vertical: M3Spacing.large),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...lstTheme.map(
                    (AppMenuItem e) => CustomAppBarItem(
                      currentIndex: currentThemeIndex,
                      item: e,
                      onPressed: () => _onPressedThemeIndex(context, e.$3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarItem extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onPressed;
  final (String title, IconData icon, int index) item;

  const CustomAppBarItem(
      {Key? key,
      required this.item,
      required this.currentIndex,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (item.$3 == currentIndex)
            Positioned(
              top: 0,
              left: M3Spacing.small.size / 2,
              child: Container(
                  alignment: Alignment.centerLeft,
                  width: 5,
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.8),
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: const Offset(0, 0)),
                    ],
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
          item.$3 == currentIndex
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.05),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(0, 0)),
                    ],
                  ),
                  child: M3Button.text(
                      onPressed: onPressed,
                      child: FaIcon(item.$2,
                          color: Theme.of(context).colorScheme.primary)),
                )
              : M3Button.text(
                  onPressed: onPressed,
                  child: FaIcon(
                    item.$2,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.4),
                  )),
        ],
      ),
    );
  }
}
