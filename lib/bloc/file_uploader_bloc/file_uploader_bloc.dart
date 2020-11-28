import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import 'package:rosseti/bloc/application_bloc/application_bloc.dart';
import 'package:rosseti/repos/models/repository.dart';

part 'file_uploader_event.dart';
part 'file_uploader_state.dart';

class FileUploaderBloc extends Bloc<FileUploaderEvent, FileUploaderState> {
  final FileRepository fileRepository;
  final ApplicationBloc profileBloc;
  final String key;
  final bool startLoading;
  StreamSubscription _profileStreamSubscription;
  FileUploaderBloc(
      {this.fileRepository,
      this.profileBloc,
      this.key,
      this.startLoading = false})
      : super(PhotoIsAbsentState()) {
    if (startLoading) add(GetPhotoEvent());
    _profileStreamSubscription = profileBloc.listen((state) {
      if (state is ProfileRecivedSuccesfullyState) {
        add(GetPhotoEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _profileStreamSubscription.cancel();
    return super.close();
  }

  @override
  Stream<FileUploaderState> mapEventToState(
    FileUploaderEvent event,
  ) async* {
    if (event is GetPhotoEvent) {
      yield* mapGetPhotoEventToState();
    } else if (event is RemovePhotoEvent) {
      yield* mapDeletePhotoEventToState();
    } else if (event is AddPhotoEvent) {
      yield* mapAddPhotoEventToState(event.photo);
    }
  }

  Stream<FileUploaderState> mapGetPhotoEventToState() async* {
    yield PhotoLoadingState();
    try {
      yield PhotoRecivedState(await fileRepository.getFile(key));
    } on Exception {
      yield PhotoUploaderErrorState("Ошибка загрузки фото");
      yield PhotoIsAbsentState();
    }
  }

  Stream<FileUploaderState> mapDeletePhotoEventToState() async* {
    yield PhotoLoadingState();
    try {
      await fileRepository.deleteFile(key);
      yield PhotoIsAbsentState();
    } on Exception {
      yield PhotoUploaderErrorState("Ошибка удаления фото");
    }
  }

  Stream<FileUploaderState> mapAddPhotoEventToState(Uint8List photo) async* {
     yield PhotoLoadingState();
    try {
      await fileRepository.persistFile(key, photo);
      yield PhotoRecivedState(photo);
    } on Exception {
      yield PhotoUploaderErrorState("Ошибка загрузки фото");
      yield PhotoRecivedState(fileRepository.currentFile(key));
    }
  }
}
