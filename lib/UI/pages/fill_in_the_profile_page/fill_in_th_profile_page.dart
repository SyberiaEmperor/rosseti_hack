import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_in_the_profile_page/widgets/date_picker_table.dart';
import 'package:rosseti/UI/pages/fill_in_the_profile_page/widgets/profile_text_field.dart';

import 'package:rosseti/bloc/profile_bloc/profile_bloc.dart';
import 'package:rosseti/helpers/dialogs.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';

class FillInTheProfilePage extends StatefulWidget {
  FillInTheProfilePage({Key key}) : super(key: key);
  @override
  _FillInTheProfilePageState createState() => _FillInTheProfilePageState();
}

class _FillInTheProfilePageState extends State<FillInTheProfilePage> {
  bool didAuthenticate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    final profileTemp = RepositoryProvider.of<ProfileTempRepository>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.width, right: 20.width, bottom: 20.height),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20.height,
                      ),
                      Text(
                        "Заполнение профиля",
                        style: Theme.of(context).textTheme.headline,
                      ),
                      SizedBox(
                        height: 8.height,
                      ),
                      Container(
                        //width: ,
                        child: Text(
                          "Введите свои персональные данные",
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      SizedBox(
                        height: 25.height,
                      ),
                      ProfileTextField(),
                      SizedBox(
                        height: 14.height,
                      ),
                      DatePickerTable(
                        dateTime: profileTemp.birthday,
                        text: "День рождения",
                        onChanged: (v) => profileTemp.birthday = v,
                      ),
                      DatePickerTable(
                        dateTime: profileTemp.startWorking,
                        text: "Дата устройства на работу",
                        onChanged: (v) => profileTemp.startWorking = v,
                      ),
                      SizedBox(
                        height: 10.height,
                      ),
                      Container(
                        height: 52.height,
                        width: 320.width,
                        child: RaisedButton(
                          onPressed: () {
                            profileBloc.add(ProfileSaveChangesEvent());
                          },
                          child: Text(
                            "Сохранить",
                            style: TextStyle(
                              fontFamily:
                                  Theme.of(context).textTheme.body1.fontFamily,
                              color: Colors.white,
                              fontSize: 16.height,
                            ),
                          ),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      SizedBox(
                        height: 16.height,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                //хз почему так низко подучается
                top: MediaQuery.of(context).size.height * 0.5,
                child: BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileErrorState) {
                      showWarningDialog("Внимание!", state.errorText, context);
                    } else if (state is ProfileSavedSuccessfullyState) {
                      Navigator.of(context).pop();
                    }
                  },
                  builder: (context, state) {
                    if (state is ProfileSavingState)
                      return Platform.isAndroid
                          ? Center(child: CircularProgressIndicator())
                          : Center(child: CupertinoActivityIndicator());
                    else
                      return Container();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
