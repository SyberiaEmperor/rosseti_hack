import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/suggestion_page/suggestion_page.dart';
import 'package:rosseti/models/registry_item.dart';

class SuggestionItem extends StatelessWidget {
  final RegistryItem registryItem;

  SuggestionItem(this.registryItem);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SuggestionPage(registryItem),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 5.height,
        ),
        color: Colors.white,
        height: 128.height,
        padding: EdgeInsets.symmetric(
          horizontal: 20.width,
          vertical: 10.height,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  registryItem.author,
                  style: TextStyle(
                    fontSize: 12.height,
                  ),
                ),
                Text(
                  registryItem.dateString,
                  style: TextStyle(
                    fontSize: 12.height,
                    color: Color(0xFFCDCACA),
                  ),
                ),
                Text(
                  registryItem.status.asString,
                  style: TextStyle(
                    color: registryItem.status.asColor,
                    fontSize: 12.height,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.height,
            ),
            Container(
              alignment: Alignment.center,
              height: 42.height,
              child: Text(
                registryItem.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.height,
                ),
              ),
            ),
            SizedBox(
              height: 5.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      registryItem.numberAccepted.toString(),
                      style: TextStyle(
                        fontSize: 18.height,
                      ),
                    ),
                    Text(
                      "поддержали",
                      style: TextStyle(
                        fontSize: 10.height,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${registryItem.uniq}%",
                      style: TextStyle(
                        fontSize: 18.height,
                      ),
                    ),
                    Text(
                      "уникальность",
                      style: TextStyle(
                        fontSize: 10.height,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${registryItem.popularity}%",
                      style: TextStyle(
                        fontSize: 18.height,
                      ),
                    ),
                    Text(
                      "популярность",
                      style: TextStyle(
                        fontSize: 10.height,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
