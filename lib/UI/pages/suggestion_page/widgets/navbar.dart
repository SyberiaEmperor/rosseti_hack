import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/models/registry_item.dart';

class SuggestionNavbar extends StatefulWidget {
  final RegistryItem registryItem;

  SuggestionNavbar(this.registryItem);

  @override
  _SuggestionNavbarState createState() => _SuggestionNavbarState();
}

class _SuggestionNavbarState extends State<SuggestionNavbar> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    
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
            onTap: (){},
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
            onTap: () {
              //TODO поменять liked
              setState(() {
                liked = true;
              });
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
                color: liked ? Colors.black: Colors.white,
                size: 25.height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}