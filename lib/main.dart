import 'package:app_tiktak/config/theme/app_theme.dart';
import 'package:app_tiktak/presentation/providers/discover_provider.dart';
import 'package:app_tiktak/presentation/screen/discover/discover_screenn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => DiscoverProvider()..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'Tiktak',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
