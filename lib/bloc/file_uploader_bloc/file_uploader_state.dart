part of 'file_uploader_bloc.dart';

abstract class FileUploaderState extends Equatable {
  const FileUploaderState();

  @override
  List<Object> get props => [];
}

class PhotoLoadingState extends FileUploaderState {}

class PhotoIsAbsentState extends FileUploaderState {}

class PhotoRecivedState extends FileUploaderState {
  final Uint8List photo;
  PhotoRecivedState(this.photo);
}

class PhotoUploaderErrorState extends FileUploaderState {
  final String errorText;

  PhotoUploaderErrorState(this.errorText);
}
