
import 'package:rosseti/models/profile.dart';

class ProfileTempRepository {
  String name = '';
  String surname = '';
  String secondName = '';
  String phone = '';
  String _email = '';
  String get email=>_email;
  String education = '';
  String unit = '';
  DateTime startWorking;
  String post = '';
  DateTime birthday;
    
 int messagesCount;
 int approvedSuggestions;

  String firstPage;
  String secondPage;
  String avatar;

  void clear() {
    name = '';
    surname = '';
    secondName = '';
    phone = '';
    _email = '';
    education = '';
    unit = '';
    startWorking = null;
    post = '';
    birthday = null;
  }



  Profile get profile => Profile(
        name: name,
        surname: surname,
        secondName: secondName,
        phone: phone,
        education: education,
        email: email,
        startWorking: startWorking,
        post: post,
        birthday: birthday,
        unit: unit
      );

  void getDataFromProfile(Profile profile) {
    name = profile.name;
    surname = profile.surname;
    secondName=profile.secondName;
    phone=profile.phone;
    education=profile.education;
    post=profile.post;
    birthday=profile.birthday;
    startWorking=profile.startWorking;
    birthday=profile.birthday;
    unit=profile.unit;
    messagesCount=profile.messagesCount;
    approvedSuggestions=profile.approvedSuggestions;
  }
}
