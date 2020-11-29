import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/bloc/profile_bloc/profile_bloc.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';
import 'package:rosseti/widgets/input_field.dart';

class ProfileTextField extends StatefulWidget {
  @override
  _ProfileTextFieldState createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  _ProfileTextFieldState();
  final passwordController = TextEditingController();
  final loginContoller = TextEditingController();

  FocusNode focusNameNode = FocusNode();
  FocusNode focusSurnameNode = FocusNode();
  FocusNode focusLastNameNode = FocusNode();
  FocusNode focusPostNode = FocusNode();
  FocusNode focusEducationNode = FocusNode();
  FocusNode focusUnitNode = FocusNode();

  @override
  void dispose() {
    focusPostNode.dispose();
    focusEducationNode.dispose();
    focusNameNode.dispose();
    focusSurnameNode.dispose();
    focusLastNameNode.dispose();
    focusUnitNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileTemp = RepositoryProvider.of<ProfileTempRepository>(context);
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (_,state) {
      return Column(
        children: <Widget>[
          InputField(
            initialValue: profileTemp.surname,
            onChanged: (v) => profileTemp.surname = v.trim(),
            name: 'Фамилия',
            focusNode: focusSurnameNode,
            nextFocusNode: focusNameNode,
          ),
          SizedBox(
            height: 12.height,
          ),
          InputField(
            initialValue: profileTemp.name,
            onChanged: (v) => profileTemp.name = v.trim(),
            name: 'Имя',
            nextFocusNode: focusLastNameNode,
            focusNode: focusNameNode,
          ),
          SizedBox(
            height: 12.height,
          ),
          InputField(
            initialValue: profileTemp.secondName,
            onChanged: (v) => profileTemp.secondName = v.trim(),
            name: 'Отчество',
            nextFocusNode:focusPostNode ,
            focusNode:focusLastNameNode ,
          ),
          SizedBox(
            height: 12.height,
          ),
          InputField(
            initialValue: profileTemp.post,
            onChanged: (v) => profileTemp.post = v.trim(),
            name: 'Должность',
            nextFocusNode:focusEducationNode ,
            focusNode:focusPostNode ,
          ),
          SizedBox(
            height: 12.height,
          ),
          InputField(
            initialValue: profileTemp.education,
            onChanged: (v) {
              profileTemp.education = v.trim();
            },
            name: 'Образование',
            focusNode: focusEducationNode,
            nextFocusNode: focusUnitNode,
          ),
          SizedBox(
            height: 12.height,
          ),
          InputField(
            initialValue: profileTemp.unit,
            onChanged: (v) {
              profileTemp.unit = v.trim();
            },
            name: 'Подразделение',
            focusNode: focusUnitNode,
            textInputAction: TextInputAction.go,
          ),
        ],
      );
    });
  }
}
