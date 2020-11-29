import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/widgets/suggestion_item.dart';
import 'package:rosseti/bloc/make_statemants_bloc/make_statements_bloc.dart';
import 'package:rosseti/models/registry_item.dart';

class StepSixUniqueness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MakeStatementsBloc, MakeStatementsState>(
        buildWhen: (p, c) {
      return !(p is InformState);
    }, builder: (context, state) {
      if (state is InformState) {
        var uniqueness =
            state.percent; //TODO все отображать в зависимости от уникальности
        bool isUnique = uniqueness >= 55;
        var text = isUnique
            ? "Отлично! Таких предложений ещё нет в реестре. Можно продолжить заполнение, осталось совсем немного"
            : "Настоятельно рекомендуем ознакомиться с похожими решениями перед продолжением:";
        var color = isUnique ? Color(0xFFA9D702) : Color(0xFFEB2C02);
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.height,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.width,
                ),
                child: Text(
                  "Уникальность вашего предложения:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.height,
                  ),
                ),
              ),
              Text(
                "${state.percent}%",
                style: TextStyle(
                  color: color,
                  fontSize: 64.height,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 43.height,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.width,
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.height,
                    color: Color(0xFFA3AEB2),
                  ),
                ),
              ),
              ...state.items.map((e) => SuggestionItem(
                  e)) //TODO отобразить список похожих предложений
            ],
          ),
        );
      } else
        return Center(
          child: CircularProgressIndicator(),
        );
    });
  }
}
