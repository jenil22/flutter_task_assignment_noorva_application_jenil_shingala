import 'package:flutter/material.dart';
import 'src/core/theme/app_theme.dart';
import 'src/features/home/presentation/pages/home_page.dart';
import 'src/features/chat/presentation/pages/chat_page.dart';

void main() {
  runApp(const NoorvaApp());
}

class NoorvaApp extends StatelessWidget {
  const NoorvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noorva AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      // Using a simple routing setup
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/chat': (context) => const ChatPage(),
      },
    );
  }
}
