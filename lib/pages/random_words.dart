import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:myfirstflutter/backends/facebook_sign_in.dart';
import 'package:myfirstflutter/backends/google_sign_in.dart';
import 'package:myfirstflutter/backends/popup_constants.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.onAuthStateChanged.listen(
            (status) {
              if (status == null) {
                Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (Route<dynamic> route) => false);
              } else {
                return;
              }
            }
    );
  }

  Future<void> _account() async {
    FirebaseUser user = await _auth.currentUser();
    String dataUser = user.uid;
    Text('$dataUser');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_account'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: event,
            itemBuilder: (BuildContext context) {
              return Constants.choises.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void event(String choice) {
    if (choice == Constants.Bookmark) {
      return _pushSaved();
    } else if (choice == Constants.SignOut) {
      return _signOut();
    }
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
              .divideTiles(tiles: tiles, context: context,)
              .toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided,),
          );
        },
      ),
    );
  }



  void _signOut() {
    SignInWithGoogle signInWithGoogle = SignInWithGoogle();
    SignInWithFacebook signInWithFacebook = SignInWithFacebook();
    FirebaseAuth.instance.signOut().then(
            (value) {
              try {
                signInWithGoogle.googleSignOut();
                signInWithFacebook.facebookSignOut();
                print('Signed out, going back to Main.');
                Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (Route<dynamic> route) => false);
              } catch (e) {
                print(e);
              }
            }
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if(i.isOdd) return Divider();

          final index = i ~/ 2;
          if(index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}