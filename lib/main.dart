import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            // child: _buildImage('flutter.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
            child: const Text(
              'Let\'s go right away!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()),
                  (Route<dynamic> route) => route is HomePage);
            }),
      ),
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: Image.asset('assets/img/image-removebg-preview.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: Image.asset('assets/img/img1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: Image.asset('assets/img/img2.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Icon(Icons.arrow_back, size: 30),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward, size: 30),
      done: ElevatedButton(
        child: const Text(
          'Done',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        onPressed: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()),
              (Route<dynamic> route) => route is HomePage);
        },
      ),
      // curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

List a = [
  {
    'img': 'assets/img/img4.png',
    'name': 'Somnath',
  },
  {
    'img': 'assets/img/img5.png',
    'name': 'Kutubminar',
  },
  {
    'img': 'assets/img/img6.png',
    'name': 'Lal Kila',
  },
  {
    'img': 'assets/img/img7.png',
    'name': 'taj Mahal',
  },
  {
    'img': 'assets/img/img8.png',
    'name': 'Jamu Kashmir',
  },
  {
    'img': 'assets/img/img9.png',
    'name': 'WaterFlow',
  },
  {
    'img': 'assets/img/img10.png',
    'name': 'Sunset',
  },
  {
    'img': 'assets/img/img11.png',
    'name': 'Waterpark',
  },
  {
    'img': 'assets/img/img13.png',
    'name': 'Garden',
  }
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.photo)),
                Tab(icon: Icon(Icons.slow_motion_video_sharp)),
                Tab(icon: Icon(Icons.music_note_sharp)),
              ]),
              title: const Text(
                'My App',
                style: TextStyle(fontSize: 30),
              ),
              centerTitle: true,
              elevation: 10),
          body: TabBarView(
            children: [
              Container(
                  child: ListView(
                children: [
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    children: [
                      ...a
                          .map(
                            (e) => Column(
                              children: [
                                Container(
                                  child: Center(child: Image.asset(e['img'])),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(style: BorderStyle.solid),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  padding: EdgeInsets.only(
                                      bottom: 10, right: 10, top: 5, left: 5),
                                  height: 150,
                                ),
                                Text(
                                  e['name'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                          .toList()
                    ],
                  )
                ],
              )),
              Container(

              ),
              Container(
                color: Colors.brown,
              ),
            ],
          )),
    );
  }
}
