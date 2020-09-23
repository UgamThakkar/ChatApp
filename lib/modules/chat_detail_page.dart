import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/components/chat_bubble.dart';
import 'package:flutter_app1/components/chat_detail_page_appbar.dart';
import 'package:flutter_app1/models/chat_message.dart';
import 'package:flutter_app1/models/send_menu_items.dart';

enum MessageType{
  Sender,
  Receiver,
}
// ignore: must_be_immutable
class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
 List<ChatMessage> chatMessage = [
   ChatMessage(message: "hi bro", type: MessageType.Receiver),
   ChatMessage(message: "hope you are doing good", type: MessageType.Receiver),
   ChatMessage(message: "Wanted to talk to you", type: MessageType.Receiver),
   ChatMessage(message: "hows everything going", type: MessageType.Sender),

 ];
 List<SendMenuItems> menuItems = [
   SendMenuItems(text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
   SendMenuItems(text: "Document", icons: Icons.insert_drive_file, color: Colors.orange),
   SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.red),
   SendMenuItems(text: "Location", icons: Icons.location_on, color: Colors.pink),
   SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.green),
 ];

 void showModal(){
   showModalBottomSheet(
     context: context,
     builder: (context){
         return Container(
           height: MediaQuery.of(context).size.height/2,
             color: Color(0xff737373),
             child: Container(
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
               ),
               child: Column(
                 children: <Widget>[
                   SizedBox(height: 10,),
                   Center(
                     child: Container(
                       height: 4,
                       width: 50,
                       color: Colors.grey.shade200,
                     ),
                   ),
                   SizedBox(height: 10,),
                   ListView.builder(
                     itemCount: menuItems.length,
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index){
                       return Container(
                         padding: EdgeInsets.only(top:10,bottom:5),
                         child: ListTile(
                           leading: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color: menuItems[index].color.shade50,
                             ),
                             height: 48,
                             width: 48,
                             child: Icon(menuItems[index].icons,size:20,color: menuItems[index].color.shade400,),
                           ),
                           title: Text(menuItems[index].text ),
                         ),
                       );
                     },
                   ),
                 ],
               ),
             ),
         );
     },


   );
 }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: ChatDetailPageAppBar(),
          body: Stack(
            children: <Widget>[
              ListView.builder(
                itemCount: chatMessage.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return ChatBubble(
                    chatMessage: chatMessage[index],
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 16, bottom: 10),
                  height: 80,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          showModal();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Icons.add, color:Colors.white,size: 21,),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type message",
                            hintStyle: TextStyle(color:Colors.grey.shade500),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(right: 30, bottom: 50),
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.send,color: Colors.white,),
                    backgroundColor: Colors.pink,
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
      );
  }
}
