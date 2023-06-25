import 'package:flutter/material.dart';
import 'package:meiju_flutter/screens/home_scrollview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '美剧',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 53, 82, 112)),
        useMaterial3: true,
      ),
      home: const HomePage(
        title: '海外剧集',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double gridHeight() {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom - 240.0;
    return newheight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const SafeArea(
        child: HomeScrollView(),

        // Column(
        //   children: [
        //     Container(
        //       color: const Color(0xF1F1F1),
        //       height: 150.0,
        //       child: HomeSwiper(
        //         dataList: _item.lunbo,
        //         tapped: (item) {
        //           tappedItem(item);
        //         },
        //       ),
        //     ),
        //     Expanded(
        //       // height: gridHeight(),
        //       child: HomeGridView(
        //         dataList: _item.list,
        //         tapped: (item) {
        //           tappedItem(item);
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
