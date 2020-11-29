import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/chat_page/chat_page.dart';
import 'package:rosseti/models/registry_item.dart';
import 'package:rosseti/repos/entities/profile_repository.dart';

class SuggestionNavbar extends StatelessWidget {
  final RegistryItem registryItem;
  final Function() onDislike;
  final Function() onLike;
  SuggestionNavbar(this.registryItem, {this.onDislike, this.onLike});

  @override
  Widget build(BuildContext context) {
    bool liked = registryItem.isLiked;
    return Container(
      height: 88.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 40,
            color: Color.fromRGBO(163, 174, 179, 0.25),
          )
        ],
      ),
      padding: EdgeInsets.only(
        right: 25.width,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Chat(
                            RepositoryProvider.of<ProfileRepository>(context)
                                .currentData,
                            registryItem.chatID,
                            registryItem.title,
                          )));
            },
            child: Container(
              alignment: Alignment.center,
              width: 212.width,
              height: 52.height,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                "Обсудить",
                style: TextStyle(
                  fontSize: 18.height,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.width,
          ),
          GestureDetector(
            onTap: () async {
              if (liked) {
                onDislike();
              } else {
                onLike();
              }
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 52.height,
              width: 52.height,
              decoration: BoxDecoration(
                border: liked ? Border.all() : null,
                color: liked ? Colors.white : Color(0xFFA9D702),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                liked ? Icons.check_circle_outline_rounded : Icons.thumb_up,
                color: liked ? Colors.black : Colors.white,
                size: 25.height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
