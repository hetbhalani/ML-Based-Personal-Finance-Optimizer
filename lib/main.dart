import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ml_based_personal_finance_optimizer/frontend/user_module/utils/app_themes/app_theme.dart';
import 'package:ml_based_personal_finance_optimizer/frontend/user_module/views/auth_view/sign_up_page_view.dart';
import 'package:ml_based_personal_finance_optimizer/frontend/user_module/views/auth_view/sign_in_page_view.dart';
import 'package:ml_based_personal_finance_optimizer/frontend/user_module/views/home_page.dart';
import 'package:ml_based_personal_finance_optimizer/frontend/user_module/views/chatbot_view/chatbot_screen.dart';
import 'package:ml_based_personal_finance_optimizer/frontend/user_module/views/settings_view/user_profile_view.dart';
import 'package:ml_based_personal_finance_optimizer/frontend/user_module/views/analysis_view/analysis_page.dart';
import 'package:ml_based_personal_finance_optimizer/frontend/user_module/views/goals_view/goals_page.dart';
import 'firebase_options.dart';
import 'frontend/admin_module/views/admin_view/admin_dashboard.dart';
import 'frontend/user_module/controllers/theme_controller/theme_controller.dart';
import 'frontend/user_module/controllers/transaction_controllers/transaction_controller.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    Get.put(TransactionController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      initialRoute: '/signup',
      getPages: [
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
            transition: Transition.upToDown,
          transitionDuration: Duration(milliseconds: 200),
        ),
        GetPage(
          name: '/signin',
          page: () => SignInPage(),
          transition: Transition.downToUp,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/homePage',
          page: () => HomePage(),
          transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/chatbot',
          page: () => ChatBotScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/user-profile',
          page: () => UserProfileView(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/analysis',
          page: () => AnalysisPage(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/goals',
          page: () => GoalsPage(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/admin-dashboard',
          page: () => AdminDashboard(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
