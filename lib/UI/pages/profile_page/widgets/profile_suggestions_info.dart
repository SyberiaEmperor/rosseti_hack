import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/app_colors.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/profile_page/profile_page.dart';
import 'package:rosseti/UI/widgets/suggestion_item.dart';
import 'package:rosseti/bloc/news_bloc/news_bloc.dart';
import 'package:rosseti/bloc/profile_bloc/profile_bloc.dart';
import 'package:rosseti/repos/entities/profile_repository.dart';
import 'package:rosseti/bloc/news_bloc/news_state.dart' as news_states;

class ProfileSuggestionsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ProfileRepository profileRep =
        RepositoryProvider.of<ProfileRepository>(context);
    // ignore: close_sinks
    NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);
    return Column(children: [
      Container(
          color: AppColors.white,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Text("Мои предложения:",
                style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: ResponsiveSize.width(14))),
          )),
      BlocConsumer<NewsBloc, news_states.NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is news_states.InitialNewsState) {
              var reg = newsBloc.registry;
              var id = profileRep.currentData.id;
              var list = reg.statements.where((element) =>
                  element.user.id != null && element.user.id == id);
              List<Widget> widgets = [];
              list.forEach((element) {
                widgets.add(Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: SuggestionItem(element),
                ));
              });
              widgets = widgets.toList();
              print(widgets.length);
              return Container(
                height: MediaQuery.of(context).size.height * 0.33,
                child: ListView.builder(
                  itemCount: widgets.length,
                  itemBuilder: (_, index) {
                    return widgets[index];
                  },
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          })
    ]);
  }
}
