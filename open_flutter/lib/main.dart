import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openflutter/BottomNav.dart';
import './auth/auth.dart';
import 'OurVision.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
bool isLoggedIn = false;

void onTapToolbar(int n, BuildContext context) {
  if (n == 1) {
    if (context.toString().contains('MainNavDrawer')) {
      print('Already There');
    } else {
      Navigator.pushReplacementNamed(context, _HomeContentState().rtName);
    }
  } else if (n == 2) {
    if (context.toString().contains('Gallery')) {
      print('Already There');
    } else {
      Navigator.pushReplacementNamed(context, _GalleryState().rtName);
    }
  } else if (n == 3) {
    if (context.toString().contains('AboutUs')) {
      print('Already There');
    } else {
      Navigator.pushReplacementNamed(context, _AboutUsState().rtName);
    }
  } else if (n == 4) {
    if (context.toString().contains('OurVision')) {
      print('Already There');
    } else {
      Navigator.pushReplacementNamed(context, OurVision().rtName);
    }
  }
}

Drawer appToolbar(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        Container(
          color: Colors.green,
          height: 150,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: AssetImage('images/logomain.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        createDrawerItem(
            icon: Icons.home, text: 'Home', n: 1, context: context),
        createDrawerItem(
            icon: Icons.photo, text: 'Gallery', n: 2, context: context),
        createDrawerItem(
            icon: Icons.info, text: 'About Us', n: 3, context: context),
        createDrawerItem(
            icon: Icons.remove_red_eye,
            text: 'Our Vision',
            n: 4,
            context: context),
      ],
    ),
  );
}

Widget createDrawerItem(
    {IconData icon,
    String text,
    GestureTapCallback onTap,
    int n,
    BuildContext context}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: () {
      onTapToolbar(n, context);
    },
  );
}

Image carouselImg(String url) {
  return Image(
    image: NetworkImage(url),
    fit: BoxFit.fitHeight,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
              : null,
        ),
      );
    },
  );
}

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      home: MyHomePage(title: 'Firebase Auth Demo'),
    );
  }
}

TextStyle defaultTextStyle(double size) {
  return TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: size,
  );
}

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String rtName = '/AboutUs';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: aboutUs(),
        drawer: appToolbar(context),
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  Container aboutUs() {
    return Container(
        margin: EdgeInsets.all(0),
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0),
              child: SizedBox(
                  height: 200.0,
                  child: Carousel(
                    images: [
                      carouselImg('http://18.197.247.183/g4.jpg'),
                      carouselImg('http://18.197.247.183/g5.jpg'),
                      carouselImg('https://www.upesopen.org/b.png'),
                      carouselImg('http://18.197.247.183/MIC.PNG'),
                      // ExactAssetImage("assets/images/LaunchImage.jpg")
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.lightGreenAccent,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0.0),
                    borderRadius: true,
                    moveIndicatorFromBottom: 180.0,
                    noRadiusForIndicator: true,
                  )),
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Aware',
                      style: defaultTextStyle(45),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://www.upesopen.org/img/educate.png'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        'We aim at spreading awareness about the advantages of using Open source softwares over conventional proprietary softwares.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              elevation: 5,
              margin: EdgeInsets.all(7),
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Adopt',
                      style: defaultTextStyle(45),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://www.upesopen.org/img/adopt.png'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        'Spreading awareness is futile until and unless we motivate people to adopt the prevailing open source softwares in their work environment.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              elevation: 5,
              margin: EdgeInsets.all(7),
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Contribute',
                      style: defaultTextStyle(45),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://www.upesopen.org/img/contribute.png'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        'The whole concept of open source revolves around community which uses it and contributing to the community is always a matter of prestige.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              elevation: 5,
              margin: EdgeInsets.all(7),
            ),
          ],
        ));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      print("Hii");
      // runApp(MaterialApp(home: MyHomePage(title: 'Firebase Auth Demo')));
      runApp(MaterialApp(
          home: MainNavDrawer(),
          routes: {
            '/main': (context) => MainNavDrawer(),
            '/signIn': (context) => SignInPage(),
            '/AboutUs': (context) => AboutUs(),
            '/gallery': (context) => Gallery(),
            '/ourVision': (context) => OurVision(),
            '/homeBottomNav': (context) => HomeBottomNav(),
          },
          theme: ThemeData(
              // primaryColor: Color(0XFF212845),
              //scaffoldBackgroundColor: Color(0XFF212845),
              primarySwatch: Colors.green,
              buttonColor: Colors.green,
              textTheme: TextTheme(
                  button: TextStyle(
                color: Colors.green, // This is not working.
                //fontSize: 30.0,
              )))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Image(
                          image: AssetImage('images/logomain.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text(
                      'OPEN UPES',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text(
                      'Aware | Adopt | Contribute',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: const Text('Test SignIn/SignOut'),
              onPressed: () => _pushPage(context, SignInPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}

class MainNavDrawer extends StatefulWidget {
  @override
  _MainNavDrawerState createState() => _MainNavDrawerState();
}

class _MainNavDrawerState extends State<MainNavDrawer> {

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        FirebaseAuth.instance.signOut();
        isLoggedIn = false;
        break;
      case 'Settings':
        break;
      case 'Login':
        Navigator.pushNamed(context, '/signIn');
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPEN UPES'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {isLoggedIn ? 'Logout' : 'Login', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        backgroundColor: Colors.green,
      ),
      drawer: appToolbar(context),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String rtName = '/main';


  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
            isLoggedIn = true;
          })
        : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
            isLoggedIn = true;
          })
        : null);
    return Column(children: <Widget>[
      Expanded(
          flex: 1,
          child: Carousel(
            images: [
              carouselImg('http://18.197.247.183/g4.jpg'),
              carouselImg('http://18.197.247.183/g5.jpg'),
              carouselImg('https://www.upesopen.org/b.png'),
              carouselImg('http://18.197.247.183/MIC.PNG'),
              // ExactAssetImage("assets/images/LaunchImage.jpg")
            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.lightGreenAccent,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.purple.withOpacity(0.0),
            borderRadius: true,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
          )),
      Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/logomain.png',
              height: 150,
            ),
            Text(
              'In association with :',
              style: defaultTextStyle(20),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Image.asset('images/linuxfoundation.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Image.asset('images/ibm.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Image.asset('images/techmint.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Image.asset('images/upes.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Image.asset('images/xebia.png')),
                ],
              ),
            ),
            Text(
              'AWARE | ADOPT | CONTRIBUTE',
              style: defaultTextStyle(25),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                onClickButton(!isLoggedIn);
              },
              textColor: Colors.white,
              padding: EdgeInsets.all(15),
              child: Text('Know More',
                style: TextStyle(fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),

          ],

        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          width: double.infinity,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Our Mission',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'OPEN is a platform from where UPES shall make its presence felt in Global Open Source Fraternity. For this, we approached various global IT giants and organizations of repute for support and we were lucky that anyone we contacted promised us support.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  void onClickButton(bool authStatus) {
    if (authStatus) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    } else {
      Navigator.pushNamed(context, '/homeBottomNav');
    }
  }
}

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  int selectedIndex = 0;
  String rtName = '/gallery';

  @override
  void initState() {
    fbSetup();
    feedItem = FeedItem('', '', '');
    // TODO: implement initState

    communityPosts = db.reference().child('Gallery');

    communityPosts.onChildAdded.listen(_onEntryAdded);
    communityPosts.onChildChanged.listen(_onEntryChanged);

    super.initState();
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(FeedItem.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = FeedItem.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      drawer: appToolbar(context),
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Center(
        child: homeContainer(),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

Container homeContainer() {
  return Container(
    child: FirebaseAnimatedList(
        query: FirebaseDatabase.instance.reference().child("Gallery"),
        reverse: false,
        itemBuilder:
            (_, DataSnapshot snapshot, Animation<double> animation, int x) {
          FeedItem f = FeedItem.fromSnapshot(snapshot);
          print(f.title);
          return Card(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            elevation: 5,
            child: Column(
              children: <Widget>[
                loadImg(f.postImgUrl),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    f.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(f.description)),
              ],
            ),
          );
        }),
  );
}

Image loadImg(String url) {
  return Image(
    image: NetworkImage(url),
    fit: BoxFit.fitHeight,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
              : null,
        ),
      );
    },
  );
}
