//import 'package:js/js.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseApp app;
DatabaseReference db;
FeedItem feedItem;
List<FeedItem> items = List();
DatabaseReference communityPosts;

Future<void> fbSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = FirebaseDatabase.instance.reference();
  print(db.reference().child('messages').key);
 // db.reference().child('messages');

  // db.reference().child('CommunityPosts').child('P1').set({ 'title': 'title', 'description': 'description' , 'postImgUrl': 'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png' });
  // db.reference().child('CommunityPosts').child('P2').set({ 'title': 'title', 'description': 'description' , 'postImgUrl': 'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png' });
  // db.reference().child('CommunityPosts').child('P3').set({ 'title': 'title', 'description': 'description' , 'postImgUrl': 'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png' });
}

class HomeBottomNav extends StatefulWidget {
  @override
  _HomeBottomNavState createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int selectedIndex = 0;
  final widgetOptions = [
    liiisst(),
    Text('Add new beer'),
    Text('Favourites'),
   // Text('Favourites')
  ];

  @override
  void initState() {
    fbSetup();
    feedItem = FeedItem('', '', '');
    // TODO: implement initState

    communityPosts = db.reference().child('CommunityPosts');

    communityPosts.onChildAdded.listen(_onEntryAdded);
    communityPosts.onChildChanged.listen(_onEntryChanged);
    db.push().child('test').set('Hello');
    if(db != null){
      print('All good');
      print(communityPosts.child('P1').parent().toString());
    }

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
      appBar: AppBar(
        title: Text('OPEN UPES'),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), title: Text('News')),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), title: Text('Projects')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.green,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

Container liiisst(){
  return Container(
    child: FirebaseAnimatedList(
        query: FirebaseDatabase.instance
            .reference().child("CommunityPosts"),
        reverse: false,
        itemBuilder: (_, DataSnapshot snapshot,
            Animation<double> animation, int x) {
          FeedItem f = FeedItem.fromSnapshot(snapshot);
          print(f.title);
          return Card(
            margin: EdgeInsets.all(10),
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
        }
    ),
  );
}

ListView recyclerList() {
  List<FeedItem> feedList = [];
  feedList.add(FeedItem('Title', 'description',
      'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png'));
  feedList.add(FeedItem('Title2', 'description2',
      'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png'));
  feedList.add(FeedItem('Title3', 'description3',
      'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png'));
  feedList.add(FeedItem('Title4', 'description4',
      'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png'));

  return ListView.builder(
    itemBuilder: (context, position) {
      return Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: <Widget>[
            loadImg(feedList[position].postImgUrl),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                feedList[position].title,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(feedList[position].description)),
          ],
        ),
      );
    },
    itemCount: feedList.length,
  );
}

class FeedItem {
  String key;
  String title;
  String description;
  String postImgUrl;

  FeedItem(this.title, this.description, this.postImgUrl);
  String fbString() {
    return "{ 'title': '$title', 'description': '$description' , 'postImgUrl': '$postImgUrl' }";
  }

  FeedItem.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        description = snapshot.value["description"],
        postImgUrl = snapshot.value["postImgUrl"];

  toJson() {
    return {
      "title": title,
      "description": description,
      "postImgUrl": postImgUrl,
    };
  }
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
