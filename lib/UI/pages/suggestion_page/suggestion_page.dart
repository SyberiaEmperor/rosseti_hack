import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/custom_scroll_behavior.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/suggestion_page/widgets/navbar.dart';
import 'package:rosseti/UI/pages/suggestion_page/widgets/suggestion_info.dart';
import 'package:rosseti/UI/pages/suggestion_page/widgets/suggestion_text.dart';
import 'package:rosseti/UI/widgets/pop_back_button.dart';
import 'package:rosseti/UI/widgets/share_button.dart';
import 'package:rosseti/models/registry_item.dart';

class SuggestionPage extends StatelessWidget {
  final RegistryItem registryItem;

  SuggestionPage(this.registryItem);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SuggestionNavbar(registryItem),
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
                    action: () {
                      //TODO поделиться
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10.height,
              ),
              Text(
                "Упрощение технологии технологического подключения",
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
                        SuggestionInfo(registryItem),
                        SizedBox(
                          height: 15.height,
                        ),
                        SuggestionText(registryItem),
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
