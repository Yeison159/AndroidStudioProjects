import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FriendlyChatApp();
  }
}

String _name = 'yeison';

class FriendlyChatApp extends StatelessWidget {
  const FriendlyChatApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FriendlyChat',
        theme: defaultTargetPlatform == TargetPlatform.iOS // NEW
            ? kIOSTheme                                      // NEW
            : kDefaultTheme,
        home: ChatScreen());
  }
}

class ChatMessage   extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  const ChatMessage({Key key, this.text, this.animationController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),  // NEW
      axisAlignment: 0.0,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name, style: Theme.of(context).textTheme.headline4,),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  bool _isComposing = false;
  final FocusNode _focusNode = FocusNode();    // NEW

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FriendlyChat'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0, // NEW,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
                reverse:true,
                itemBuilder: (_ , int index )=> _messages[index],
                itemCount: _messages.length
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color:  Theme.of(context).cardColor
            ),
              child: _buildTextComposer()
          ),
        ],
      ),
    );


  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onChanged: (String text) {
                setState(() {
                  _isComposing = text.length > 0;
                });
              },
              onSubmitted: _isComposing ? _handleSubmitted : null, // MODIFIED,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
              focusNode: _focusNode,
            ),
          ),
          IconTheme(
            data: IconThemeData(color: Theme.of(context).accentColor),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(icon: Icon(Icons.send), onPressed: _isComposing                            // MODIFIED
                  ? () => _handleSubmitted(_textController.text) // MODIFIED
                  : null,     ),
            ),
          )
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {                             // NEW
      _isComposing = false;                   // NEW
    });
    ChatMessage message = ChatMessage(    //NEW
      text: text,
      animationController: AnimationController(      // NEW
        duration:  Duration(milliseconds: 700), // NEW
        vsync: this,                                 // NEW
      ), //NEW
    );                                    //NEW
    setState(() {                         //NEW
      _messages.insert(0, message);       //NEW
    });

    _focusNode.requestFocus();  // NEW
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}
