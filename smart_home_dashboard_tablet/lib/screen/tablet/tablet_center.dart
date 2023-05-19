import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabletCenter extends StatelessWidget {
  const TabletCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<(String title, IconData iconData, Color backgroundColor)>
        devices = [
      ('Living Room', FontAwesomeIcons.couch, Colors.red),
      ('Bed Room', FontAwesomeIcons.bed, Colors.blue),
      ('Kitchen', FontAwesomeIcons.utensils, Colors.green),
      ('Bath Room', FontAwesomeIcons.bath, Colors.deepOrange),
      ('Garage', FontAwesomeIcons.car, Colors.purple),
      ('Garden', FontAwesomeIcons.tree, Colors.orange),
    ];

    return M3Card(
      color: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.onBackground,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: M3Padding(
                  padding: const M3EdgeInsets.only(right: M3Spacing.medium),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network('https://picsum.photos/200',
                                  width: double.infinity, fit: BoxFit.fitWidth),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                height: kToolbarHeight * 1.5,
                                margin: EdgeInsets.only(
                                    left: M3Spacing.medium.size),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(96),
                                    topLeft: Radius.circular(96),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: M3Spacing.medium.size),
                                      padding:
                                          EdgeInsets.all(M3Spacing.medium.size),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const FaIcon(
                                        FontAwesomeIcons.fingerprint,
                                        size: 42,
                                      ),
                                    ),
                                    const Expanded(
                                        child: M3Padding(
                                      padding: M3EdgeInsets.only(
                                          left: M3Spacing.medium),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          M3Text.titleMedium(
                                            text:
                                                'Control your favorite\nroom in-app with a tap',
                                            textAlign: TextAlign.start,
                                            fontWeight: FontWeight.bold,
                                            maxLines: 2,
                                          ),
                                          M3Text.labelSmall(
                                            text:
                                                'Discover our support benefits, with one tap',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    )),
                                    M3Padding(
                                      padding: const M3EdgeInsets.only(
                                          right: M3Spacing.medium),
                                      child: M3IconButton.filledTonal(
                                        icon: FontAwesomeIcons.arrowRight,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const M3Space.medium(),
                      Expanded(
                        flex: 4,
                        child: Card(
                          color: Theme.of(context).colorScheme.surface,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          shadowColor: Theme.of(context).colorScheme.onSurface,
                          child: SizedBox(
                            width: double.infinity,
                            child: M3Padding.regular(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const M3Text.titleLarge(
                                    text: 'Energy Saving',
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 2,
                                  ),
                                  // Dropdown button selected month in year
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: M3Spacing.small.size),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer,
                                          // color: Colors.red,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: M3Spacing.small.size),
                                        child: DropdownButton<String>(
                                          value: 'January',
                                          underline: Container(
                                              height: 0,
                                              color: Colors.transparent),
                                          icon: const FaIcon(
                                              FontAwesomeIcons.chevronDown,
                                              size: 16),
                                          iconSize: 16,
                                          onChanged: (String? newValue) {},
                                          items: <String>[
                                            'January',
                                            'February',
                                            'March',
                                            'April',
                                            'May',
                                            'June',
                                            'July',
                                            'August',
                                            'September',
                                            'October',
                                            'November',
                                            'December'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: M3Text.labelSmall(
                                                text: value,
                                                textAlign: TextAlign.start,
                                                fontWeight: FontWeight.bold,
                                                maxLines: 2,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      const M3Space.medium(),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: M3Spacing.small.size),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: M3Spacing.small.size),
                                        child: DropdownButton<String>(
                                          value: 'Device',
                                          underline: Container(
                                              height: 0,
                                              color: Colors.transparent),
                                          icon: const FaIcon(
                                              FontAwesomeIcons.chevronDown,
                                              size: 16),
                                          iconSize: 16,
                                          onChanged: (String? newValue) {},
                                          items: <String>[
                                            'Device',
                                            'Device 2',
                                            'Device 3',
                                            'Device 4',
                                            'Device 5',
                                            'Device 6'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: M3Text.labelSmall(
                                                text: value,
                                                textAlign: TextAlign.start,
                                                fontWeight: FontWeight.bold,
                                                maxLines: 2,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Expanded(
                                      child: M3Padding(
                                          padding: M3EdgeInsets.symmetric(
                                              vertical: M3Spacing.medium),
                                          child: Placeholder())),
                                  Wrap(
                                    runSpacing: M3Spacing.small.size,
                                    children: [
                                      ...devices
                                          .map((e) => BottomItem(
                                              iconData: e.$2,
                                              title: e.$1,
                                              color: e.$3))
                                          .toList()
                                      // BottomItem(),
                                      // BottomItem(),
                                      // BottomItem(),
                                      // BottomItem(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                        flex: 6,
                        child: Card(
                            color: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            shadowColor:
                                Theme.of(context).colorScheme.onSurface,
                            child: Container())),
                    const Expanded(child: MusicPlayer()),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class BottomItem extends StatefulWidget {
  final IconData iconData;
  final String title;
  final Color color;

  const BottomItem(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.color})
      : super(key: key);

  @override
  State<BottomItem> createState() => _BottomItemState();
}

class _BottomItemState extends State<BottomItem> {
  double currentValue = 0.0;

  @override
  void initState() {
    //Random current value from 0.0 -> 1.0
    currentValue = Random().nextDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 6,
      height: 48,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(color: widget.color, shape: BoxShape.circle),
              child: M3Padding.medium(
                child: FaIcon(widget.iconData, color: Colors.white),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                M3Padding(
                  padding: const M3EdgeInsets.only(left: M3Spacing.regular),
                  child: M3Text.labelMedium(
                      text: widget.title,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.bold,
                      maxLines: 2),
                ),
                SizedBox(
                  height: 24.0,
                  child: Slider(
                      value: currentValue,
                      thumbColor: widget.color,
                      activeColor: widget.color,
                      onChanged: (v) {
                        setState(() {
                          currentValue = v;
                        });
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  int currentVal = 130;
  double maxVal = 260;
  bool isPlaying = false;
  Timer? timer;

  String formatHourMinuteByVal(int val) {
    var hour = val ~/ 60;
    var minute = val % 60;
    return '$hour:${minute < 10 ? '0$minute' : minute}';
  }

  void onPressedPlay() {
    setState(() => isPlaying = !isPlaying);
    if (isPlaying) {
      _animationController.repeat();
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (currentVal >= maxVal) {
            currentVal = 0;
            return;
          }
          currentVal++;
        });
      });
    } else {
      _animationController.stop();
      timer?.cancel();
      setState(() {});
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Theme.of(context).colorScheme.onSurface,
      child: Column(
        children: [
          Expanded(
              child: M3Padding(
            padding: const M3EdgeInsets.only(
                left: M3Spacing.large, top: M3Spacing.small),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: _animationController,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(999)),
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/en/3/39/The_Weeknd_-_Starboy.png',
                        fit: BoxFit.cover,
                        width: 36,
                        height: 36),
                  ),
                ),
                const M3Space.medium(),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      M3Text.bodyMedium(
                        text: 'Starboy',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        fontWeight: FontWeight.bold,
                      ),
                      M3Text.labelSmall(
                        text: 'The Weeknd',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                M3Padding(
                  padding: const M3EdgeInsets.only(right: M3Spacing.small),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        const Icon(Icons.skip_previous),
                        M3IconButton.filled(
                          onPressed: () => onPressedPlay(),
                          icon: isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        const Icon(Icons.skip_next),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          SizedBox(
            height: 8.0,
            child: Slider(
                max: maxVal,
                value: currentVal.toDouble(),
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveColor: Theme.of(context).colorScheme.secondaryContainer,
                onChanged: (v) => setState(() => currentVal = v.toInt())),
          ),
          M3Padding(
            padding: const M3EdgeInsets.only(
                left: M3Spacing.large,
                right: M3Spacing.large,
                bottom: M3Spacing.small),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                M3Text.labelSmall(text: formatHourMinuteByVal(currentVal)),
                M3Text.labelSmall(text: formatHourMinuteByVal(maxVal.toInt())),
              ],
            ),
          )
        ],
      ),
    );
  }
}
