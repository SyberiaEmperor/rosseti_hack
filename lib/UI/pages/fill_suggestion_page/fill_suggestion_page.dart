import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/dog_slider/dog_slider.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_eight_deadline.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_eleven_attachments.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_five_prediction.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_four_idea.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_nine_co_authors.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_seven_expenses.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_six_uniqueness.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_ten_suggestion.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/step_three_current_state.dart';
import 'package:rosseti/appbar/custom_appbar.dart';
import 'package:rosseti/bloc/make_statemants_bloc/make_statements_bloc.dart';
import 'package:rosseti/bloc/news_bloc/news_bloc.dart' as nb;
import 'package:rosseti/bloc/news_bloc/news_event.dart';
import 'package:rosseti/helpers/dialogs.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/repos/entities/profile_repository.dart';
import 'package:rosseti/repos/entities/repos.dart';
import '../../classes/responsive_size.dart';
import 'widgets/suggestion_navbar.dart';
import 'widgets/step_two_category.dart';
import 'widgets/step_one_title.dart';

class FillSuggestionPage extends StatefulWidget {
  @override
  _FillSuggestionPageState createState() => _FillSuggestionPageState();
}

class _FillSuggestionPageState extends State<FillSuggestionPage> {
  void _incStep() {
    int currentStep = MyApp.makeStatementsBloc.step;
    MyApp.makeStatementsBloc.add(InternetStepEvent(currentStep + 1));
  }

  StatementRepos repos;
  @override
  void initState() {
    repos = StatementRepos.getInstance();
    super.initState();
  }

  void _decStep() {
    int currentStep = MyApp.makeStatementsBloc.step;
    if (currentStep == -1) return;
    MyApp.makeStatementsBloc.add(InternetStepEvent(currentStep - 1));
  }

  List<Widget> _steps = [
    StepOneTitle(),
    StepTwoCategory(),
    StepThreeCurrentState(),
    StepFourIdea(),
    StepFivePrediction(),
    StepSixUniqueness(),
    StepSevenExpenses(),
    StepEightDeadline(),
    StepNineCoAuthors(),
    StepTenSuggestion(),
    StepElevenAttachments(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<MakeStatementsBloc, MakeStatementsState>(
        listener: (context, state) {
          final currentStep = state.step + 1;
          if (currentStep == 11) {
            Navigator.of(context).pop();
            BlocProvider.of<nb.NewsBloc>(context).add(Update(
                RepositoryProvider.of<ProfileRepository>(context).currentData));
            MyApp.makeStatementsBloc.add(InternetStepEvent(-1));
          }
          if (state is ErrorState) {
            showWarningDialog("Внимание", "Ошибка загрузки заявления", context);
          }
        },
        buildWhen: (p, c) => c.step < 10,
        builder: (context, state) {
          final currentStep = state.step + 1;
          if (currentStep == 11) {
            Navigator.of(context).pop();
            MyApp.makeStatementsBloc.add(InternetStepEvent(-1));
          }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: SuggestionNavbar(
              currentStep: currentStep,
              incStep: _incStep,
              decStep: _decStep,
            ),
            body: Column(
              children: [
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomAppbar("Шаг " + (currentStep + 1).toString()),
                    Positioned(
                      right: 30.width,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40.height,
                          width: 40.height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.5,
                              color: Color(0xFFD3DADD),
                            ),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 20.height,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.height,
                ),
                DogSlider(
                  onChanged: null,
                  countPos: 12,
                  width: 360.width,
                ),
                SizedBox(
                  height: 10.height,
                ),
                Expanded(
                  child: IndexedStack(
                    index: currentStep,
                    children: _steps,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
