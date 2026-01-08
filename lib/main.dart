import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/auth_wrapper.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAa5rd8sMLUIcRjzdleZn540L5XFixrnMU",
      authDomain: "usermanagement-fb70a.firebaseapp.com",
      projectId: "usermanagement-fb70a",
      storageBucket: "usermanagement-fb70a.firebasestorage.app",
      messagingSenderId: "487136824498",
      appId: "1:487136824498:web:a824dfde86ad01760ecdab",
    ),
  );

  runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
  ),
);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
  builder: (context, themeProvider, _) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: const AuthWrapper(),
    );
  },
);

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      ),
    );
  }
}
