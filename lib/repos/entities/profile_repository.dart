import 'package:rosseti/helpers/requests/requests.dart' as requests;
import 'package:rosseti/models/profile.dart';
import 'package:rosseti/repos/models/repository.dart';
import 'package:rosseti/helpers/validators.dart' as vd;

class ProfileRepository extends Repository<Profile> {
  final AuthenticationRepository authenticationRepository;
  // final FileRepository _fileRepository;

  ProfileRepository(
    this.authenticationRepository,
  );

  Profile _profile = Profile();

  @override
  Future<Profile> getData() async {
    try {
      _profile = await requests.getProfile();
      return _profile;
    } on requests.ExpiredToken {
      await requests.updateToken(
          authenticationRepository.login, authenticationRepository.password);
      return await requests.getProfile();
    } on requests.GettingDataFailure {
      throw LoadingFailure();
    }
  }

  @override
  Profile get currentData => _profile;

  @override
  Future<void> persistData(Profile profile) async {
    _validateProfile(profile);
    try {
      await requests.sendProfile(profile);
      _profile = profile;
    } on requests.ExpiredToken {
      await requests.updateToken(
          authenticationRepository.login, authenticationRepository.password);
      await requests.getProfile();
    } on requests.SendingDataFailure {
      throw PersistFailure();
    }
  }

  void _validateProfile(Profile profile) {
    // if (profile.name.isEmpty) {
    //   throw NameIsAbsent();
    // } else if (profile.surname.isEmpty) {
    //   throw SurnameIsAbsent();
    // } else if (profile.fathername.isEmpty) {
    //   throw FathernameIsAbsent();
    // } else if (profile.email.isEmpty) {
    //   throw EmailIsAbsent();
    // } else if (profile.passportNumber.isEmpty) {
    //   throw PassportNumberIsAbsent();
    // } else if (profile.passportSeries.isEmpty) {
    //   throw PassportSeriesIsAbsent();
    // } else if (profile.firstPage == null) {
    //   throw MainPageIsAbsent();
    // } else if (profile.secondPage == null) {
    //   throw RegisterPageIsAbsent();
    // } else if (profile.inn.isEmpty) {
    //   throw InnIsAbsent();
    // } else if (profile.address.isEmpty) {
    //   throw AddressIsAbsent();
    // } else if (profile.taxSystem < 1 || profile.taxSystem > 5) {
    //   throw TaxSystemIsAbsent();
    // } else if (!vd.validateEmail(profile.email)) {
    //   throw IncorrectEmail();
    // } else if (!vd.validatePassportSeries(profile.passportSeries)) {
    //   throw IncorrectPassportSeries();
    // } else if (!vd.validatePassportNumber(profile.passportNumber)) {
    //   throw IncorrectPassportNumber();
    // } else if (!vd.validateInn(profile.inn)) {
    //   throw IncorrectInn();
    // }
  }

  @override
  void clear() {
    _profile = Profile();
  }
}
