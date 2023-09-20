import 'package:flutter/material.dart';
import 'package:movie_app/movies_module/presentation/screens/movies_screen.dart';
import 'package:movie_app/shared/services/services_locator.dart';
import 'package:movie_app/watch_together_module/presentation/screens/watch_together_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int currentScreen = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined ) , label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.slow_motion_video) , label: "Watch Together")
        ],

        onTap: (int index){
          currentScreen  = index ;
          setState(() {

          });
        },

      ),
      body: screens[currentScreen],
    );
  }
}

List<Widget> screens = [const MoviesScreen() , WatchTogether()];