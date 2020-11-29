import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/custom_scroll_behavior.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/suggestions_feed_page/widgets/buttons.dart';
import 'package:rosseti/UI/widgets/suggestion_item.dart';
import 'package:rosseti/UI/pages/suggestions_feed_page/widgets/search.dart';
import 'package:rosseti/bloc/news_bloc/news_bloc.dart';
import 'package:rosseti/UI/pages/suggestions_feed_page/widgets/title_block.dart';
import 'package:rosseti/bloc/news_bloc/news_event.dart' as news_events;
import 'package:rosseti/bloc/news_bloc/news_state.dart' as news_states;
import 'package:rosseti/repos/entities/profile_repository.dart';

class SuggestionsFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsBloc>(context).add(news_events.Update(
        RepositoryProvider.of<ProfileRepository>(context).currentData));

    return BlocConsumer<NewsBloc, news_states.NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is news_states.InitialNewsState)
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
                      delegate: SliverChildListDelegate(state.statements
                          .map((e) => SuggestionItem(e))
                          .toList()),
                    ),
                  ],
                ),
              ),
            );
          else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
