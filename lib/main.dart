import 'dart:async';

import '../src/about_screen.dart';
import '../src/code_chomper/code_chomper.dart';
import '../src/game_screen.dart';
import '../src/shared_state/game/world.dart';
import '../src/shared_state/user.dart';
import '../src/style_sphinx/axis_questions.dart';
import '../src/style_sphinx/flex_questions.dart';
import '../src/style_sphinx/kittens.dart';
import '../src/style_sphinx/sphinx_image.dart';
import '../src/style_sphinx/sphinx_screen.dart';
import '../src/welcome_screen.dart';
import 'flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Don't prune the Flare cache, keep loaded Flare files warm and ready
  // to be re-displayed.
  FlareCache.doesPrune = false;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final World world = World();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => User()),
          ChangeNotifierProvider.value(value: world),
          ChangeNotifierProvider.value(value: world.characterPool),
          ChangeNotifierProvider.value(value: world.taskPool),
          ChangeNotifierProvider.value(value: world.company),
          ChangeNotifierProvider.value(value: world.company.users),
          ChangeNotifierProvider.value(value: world.company.joy),
          ChangeNotifierProvider.value(value: world.company.coin),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.orange,
              canvasColor: Colors.transparent),
          routes: {
            '/': (context) => const WelcomeScreen(),
            '/gameloop': (context) => const GameScreen(),
            '/about': (context) => const AboutScreen(),
            CodeChomper.miniGameRouteName: (context) {
              String filename =
                  ModalRoute.of(context)?.settings.arguments as String;
              return CodeChomper(filename);
            },
            SphinxScreen.miniGameRouteName: (context) => const SphinxScreen(),
            SphinxScreen.fullGameRouteName: (context) =>
                const SphinxScreen(fullGame: true),
            ColumnQuestion.routeName: (context) => const ColumnQuestion(),
            RowQuestion.routeName: (context) => const RowQuestion(),
            StackQuestion.routeName: (context) => const StackQuestion(),
            MainAxisCenterQuestion.routeName: (context) =>
                const MainAxisCenterQuestion(),
            MainAxisSpaceAroundQuestion.routeName: (context) =>
                const MainAxisSpaceAroundQuestion(),
            MainAxisSpaceBetweenQuestion.routeName: (context) =>
                const MainAxisSpaceBetweenQuestion(),
            MainAxisStartQuestion.routeName: (context) =>
                const MainAxisStartQuestion(),
            MainAxisEndQuestion.routeName: (context) =>
                const MainAxisEndQuestion(),
            MainAxisSpaceEvenlyQuestion.routeName: (context) =>
                const MainAxisSpaceEvenlyQuestion(),
            RowMainAxisEndQuestion.routeName: (context) =>
                const RowMainAxisEndQuestion(),
            RowMainAxisStartQuestion.routeName: (context) =>
                const RowMainAxisStartQuestion(),
            RowMainAxisSpaceBetween.routeName: (context) =>
                const RowMainAxisSpaceBetween(),
          },
        ));
  }

  @override
  void initState() {
    // Schedule a microTask that warms up the image cache with all of the style
    // sphinx images. This will run after the build method is executed, but
    // before the style sphinx is displayed.
    scheduleMicrotask(() {
      precacheImage(SphinxScreen.pyramid, context);
      precacheImage(SphinxScreen.background, context);
      precacheImage(SphinxImage.provider, context);
      precacheImage(SphinxWithoutGlassesImage.provider, context);
      precacheImage(SphinxGlassesImage.provider, context);
      precacheImage(KittyBed.redProvider, context);
      precacheImage(KittyBed.greenProvider, context);
      precacheImage(Kitty.orangeProvider, context);
      precacheImage(Kitty.yellowProvider, context);
    });
    super.initState();
  }

  @override
  void dispose() {
    world.dispose();
    super.dispose();
  }
}
