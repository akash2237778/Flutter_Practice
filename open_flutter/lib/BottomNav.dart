import 'dart:async';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';




class HomeBottomNav extends StatefulWidget {
  final FirebaseApp app;

  const HomeBottomNav({Key key, this.app}) : super(key: key);

  @override
  _HomeBottomNavState createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int _counter;
  DatabaseReference _counterRef;
  DatabaseReference _messagesRef;
  StreamSubscription<Event> _counterSubscription;
  StreamSubscription<Event> _messagesSubscription;
  bool _anchorToBottom = false;

  String _kTestKey = 'Hello';
  String _kTestValue = 'world!';
  DatabaseError _error;

  @override
  void initState() {
    super.initState();
    // Demonstrates configuring to the database using a file
    _counterRef = FirebaseDatabase.instance.reference().child('counter');
    // Demonstrates configuring the database directly
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _messagesRef = database.reference().child('messages');
    database.reference().child('counter').once().then((DataSnapshot snapshot) {
      print('Connected to second database and read ${snapshot.value}');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _counterRef.keepSynced(true);
    _counterSubscription = _counterRef.onValue.listen((Event event) {
      setState(() {
        _error = null;
        _counter = event.snapshot.value ?? 0;
      });
    }, onError: (Object o) {
      final DatabaseError error = o;
      setState(() {
        _error = error;
      });
    });
    _messagesSubscription =
        _messagesRef.limitToLast(10).onChildAdded.listen((Event event) {
          print('Child added: ${event.snapshot.value}');
        }, onError: (Object o) {
          final DatabaseError error = o;
          print('Error: ${error.code} ${error.message}');
        });
  }

  @override
  void dispose() {
    super.dispose();
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }

  Future<void> _increment() async {
    // Increment counter in transaction.
    final TransactionResult transactionResult =
    await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;
      return mutableData;
    });

    if (transactionResult.committed) {
      _messagesRef.push().set(<String, String>{
        _kTestKey: '$_kTestValue ${transactionResult.dataSnapshot.value}'
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
  }


/*  int selectedIndex = 0;
  final widgetOptions = [
    recyclerList(),
    Text('Add new beer'),
    Text('Favourites'),
  //  Text('Favourites')
  ];
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Database Example'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Center(
              child: _error == null
                  ? Text(
                'Button tapped $_counter time${_counter == 1 ? '' : 's'}.\n\n'
                    'This includes all devices, ever.',
              )
                  : Text(
                'Error retrieving button tap count:\n${_error.message}',
              ),
            ),
          ),
          ListTile(
            leading: Checkbox(
              onChanged: (bool value) {
                setState(() {
                  _anchorToBottom = value;
                });
              },
              value: _anchorToBottom,
            ),
            title: const Text('Anchor to bottom'),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              key: ValueKey<bool>(_anchorToBottom),
              query: _messagesRef,
              reverse: _anchorToBottom,
              sort: _anchorToBottom
                  ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
                  : null,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Text("$index: ${snapshot.value.toString()}"),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}



      /*Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('OPEN UPES'),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Home')),
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

ListView recyclerList(){
  List<FeedItem> feedList = [];
  feedList.add(FeedItem('Title', 'description', 'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png'));
  feedList.add(FeedItem('Title2', 'description2', 'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png'));
  feedList.add(FeedItem('Title3', 'description3', 'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png'));
  feedList.add(FeedItem('Title4', 'description4', 'https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png'));

  return ListView.builder(
      itemBuilder: (context , position){
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          child: Column(
            children: <Widget>[
            loadImg(feedList[position].postImgUrl),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(feedList[position].title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),),
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


class FeedItem{
  String title;
  String description;
  String postImgUrl;

  FeedItem(this.title, this.description, this.postImgUrl);

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
*/