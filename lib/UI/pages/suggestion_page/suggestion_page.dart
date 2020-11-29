import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:rosseti/UI/classes/custom_scroll_behavior.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/suggestion_page/widgets/navbar.dart';
import 'package:rosseti/UI/pages/suggestion_page/widgets/suggestion_info.dart';
import 'package:rosseti/UI/pages/suggestion_page/widgets/suggestion_text.dart';
import 'package:rosseti/UI/widgets/pop_back_button.dart';
import 'package:rosseti/UI/widgets/share_button.dart';
import 'package:rosseti/models/registry_item.dart';

class SuggestionPage extends StatefulWidget {
  final RegistryItem registryItem;

  SuggestionPage(this.registryItem);

  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  void dislike() {
    widget.registryItem.disliked();
    setState(() {});
  }

  void like() {
    widget.registryItem.liked();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SuggestionNavbar(widget.registryItem,
            onDislike: dislike, onLike: like),
        body: Container(
          margin: EdgeInsets.only(
            top: 30.height,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopBackButton(),
                  ShareButton(
                    action: () async {
                      await FlutterShare.share(
                          title: 'Поделиться ссылкой на предложение',
                          chooserTitle: 'Поделиться ссылкой на предложение',
                          linkUrl:
                              'http://poc.deeplink.flutter.dev/channel/as8ght7vc');
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10.height,
              ),
              Text(
                widget.registryItem.title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.height,
                ),
              ),
              SizedBox(
                height: 10.height,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SuggestionInfo(widget.registryItem),
                        SizedBox(
                          height: 15.height,
                        ),
                        SuggestionText(widget.registryItem),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
