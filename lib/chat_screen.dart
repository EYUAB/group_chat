import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:group_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatScreen extends StatefulWidget {
  static const String id='chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth=FirebaseAuth.instance;
  late User loggedInUser;
  final _firestore= FirebaseFirestore.instance;
  late String textMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
   try{
    final user= _auth.currentUser;
    if(user != null){
       loggedInUser = user;
       print(loggedInUser.email);
       print(loggedInUser.email);
    }
   }
   catch(e){
    print(e);
   }
   
  }
  void getStreamMessage() async{
      await for( final snapShoot in _firestore.collection('messages').snapshots()){
        for(final message in snapShoot.docs){
          print(message.data());
        }

       }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                // getStreamMessage();
                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                List<Text> messageWidgets;
                if(snapshot.hasData){
                  final messages=snapshot.data?.docs;
                  messageWidgets=[];
                  for(final message in messages!){
                       final messageText=message.data()['text'];
                       final messageSender=message.data()['sender'];
                       final messageWidget= Text('$messageText from $messageSender');
                       messageWidgets.add(messageWidget);
                  }
                }
                return Column(
                    children: messageWidgets,
                  );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        textMessage=value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                    _firestore.collection('messages').add(
                      {
                        'text': textMessage,
                        'sender': loggedInUser.email,
                      }
                    );
                    },
                    child: Container(
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
