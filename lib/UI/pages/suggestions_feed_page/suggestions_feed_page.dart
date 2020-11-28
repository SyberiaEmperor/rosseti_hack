import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/custom_scroll_behavior.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/suggestions_feed_page/widgets/buttons.dart';
import 'package:rosseti/UI/widgets/suggestion_item.dart';
import 'package:rosseti/UI/pages/suggestions_feed_page/widgets/search.dart';
import 'package:rosseti/UI/pages/suggestions_feed_page/widgets/title_block.dart';
import 'package:rosseti/models/registry_item.dart';

class SuggestionsFeedPage extends StatelessWidget {
  final List<RegistryItem> list = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
  ]
      .map(
        (e) => RegistryItem.test(e),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  TitleBlock(),
                  Search(),
                ],
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              stretch: true,
              //elevation: 0,
              centerTitle: true,
              pinned: true,
              flexibleSpace: Buttons(),
              expandedHeight: 50.height,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  list.map((e) => SuggestionItem(e)).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
