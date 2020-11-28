import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/helpers/chat/chat_controller.dart';
import 'package:rosseti/models/message.dart';

import 'chat_message.dart';
import 'navbar_action_button.dart';

class ListOfMessagesAndNavbarChat extends StatefulWidget {
  final int chatID; // ID чата
  final int userID;
  //final User user; // админ(кнопки по-умолчанию)/ номер телефона пользователя
  final void Function(BuildContext context, String message)
      showConnectionStatus;

  ListOfMessagesAndNavbarChat(
      this.userID,
      this.chatID,
      /* this.user,*/ this.showConnectionStatus);

  @override
  _ListOfMessagesAndNavbarChatState createState() =>
      _ListOfMessagesAndNavbarChatState();
}

class _ListOfMessagesAndNavbarChatState
    extends State<ListOfMessagesAndNavbarChat> {
  TextEditingController textEditingController =
      TextEditingController(); // контроллер ввода сообщения

  RefreshController _refreshController =
      RefreshController(); // Котроллер загрузки сообщений
  List<ChatMessage> listOfMessages = List<ChatMessage>(); // Список сообщений

  ChatController chatController;

  addMessage(Message msg) {
    bool needDate = listOfMessages.isEmpty ||
        msg.time.day !=
            listOfMessages[listOfMessages.length - 1].message.time.day;
    listOfMessages.add(
      ChatMessage(
        userID: widget.userID,
        message: msg,
        chatID: widget.chatID,
        date: needDate,
      ),
    );
  }

  void onMessage(Map<dynamic, dynamic> message) {
    Message msg = Message.fromJson(message);
    msg.printMessage();
    addMessage(msg);
    setState(() {});
  }

  void onSubscribed() async {
    var mes = await chatController.loadMessages();
    if (mes.isNotEmpty) {
      mes.reversed.forEach((message) {
        addMessage(message);
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    //Тестовый набор:
    // listOfMessages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    //     .map((e) => Message.test(e))
    //     .map((e) => ChatMessage(
    //           userID: widget.userID,
    //           chatID: widget.chatID,
    //           message: e,
    //         ))
    //     .toList();
    chatController = ChatController(widget.chatID,
        onMessage: onMessage,
        onSubscribed: onSubscribed,
        showConnectionStatus: (status) =>
            widget.showConnectionStatus(context, status));
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveSize.height(526 + 107.0),
      child: Column(
        children: <Widget>[
          //сообщения
          Expanded(
            //flex: 74,
            child: Container(
              padding: EdgeInsets.only(
                top: ResponsiveSize.height(5),
              ),
              height: ResponsiveSize.height(526),
              child: SmartRefresher(
                enablePullUp: true,
                enablePullDown: false,
                reverse: true,
                footer: CustomFooter(
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("");
                    } else if (mode == LoadStatus.loading) {
                      body = CircularProgressIndicator(
                        backgroundColor: Theme.of(context).accentColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      );
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: ResponsiveSize.height(50),
                      child: Center(child: body),
                    );
                  },
                ),
                header: null,
                controller: _refreshController,

                /// Обработчик подзагрузки
                onLoading: () async {
                  if (chatController.canLoadMessages) {
                    // если есть что загружать - загружаем
                    var mes = await chatController.loadMessages();
                    if (mes.isNotEmpty) {
                      for (int i = 0; i < mes.length; i++) {
                        listOfMessages.insert(
                            0,
                            ChatMessage(
                              userID: widget.userID,
                              message: mes[i],
                              chatID: widget.chatID,
                            ));
                      }
                      setState(() {});
                    }
                  }
                  _refreshController.loadComplete();
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: listOfMessages,
                  ),
                ),
              ),
            ),
          ),
          //навбар
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
                  color: Color.fromRGBO(163, 174, 179, 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //панелька 123
                Container(
                  padding: EdgeInsets.only(
                    left: ResponsiveSize.width(10),
                    right: ResponsiveSize.width(10),
                    top: ResponsiveSize.height(4),
                    bottom: ResponsiveSize.height(4),
                  ),
                ),
                Container(
                  height: ResponsiveSize.height(1),
                  color: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .color
                      .withOpacity(0.2),
                ),
                //текстовое поле
                Container(
                  padding: EdgeInsets.only(
                    left: ResponsiveSize.width(10),
                    top: ResponsiveSize.height(5),
                    bottom: ResponsiveSize.height(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NavbarActionButton(
                        color: Color(0xff038DFB),
                        isIcon: true,
                        childColor: Colors.white,
                        icon: Icons.image,
                        action: () async {
                          var img = (await FilePicker.platform.pickFiles(
                                  type: FileType.image, withData: true))
                              .files
                              .first
                              .bytes;
                          if (img != null) chatController.sendMessage(img: img);
                        },
                      ),
                      Container(
                        width: ResponsiveSize.width(230),
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          minLines: 1,
                          maxLines: 5,
                          controller: textEditingController,
                          textInputAction: TextInputAction.newline,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Введите сообщение...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .fontFamily,
                              fontSize: ResponsiveSize.height(16),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (textEditingController.value.text
                              .trim()
                              .isNotEmpty) {
                            chatController.sendMessage(
                                text: textEditingController.value.text);
                            textEditingController.text = "";
                          }
                        },
                        child: Container(
                          width: ResponsiveSize.width(50),
                          height: ResponsiveSize.height(40),
                          decoration: BoxDecoration(
                            color: Color(0xff038DFB),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.send,
                              size: ResponsiveSize.height(21),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
