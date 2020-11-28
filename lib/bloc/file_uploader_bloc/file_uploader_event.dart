part of 'file_uploader_bloc.dart';

abstract class FileUploaderEvent extends Equatable {
  const FileUploaderEvent();
  @override
  List<Object> get props => [];
}
//class GetPhotoEvent extends PhotoUploaderEvent{}

class AddPhotoEvent extends FileUploaderEvent {
  final Uint8List photo;
  AddPhotoEvent(this.photo);
  @override
  List<Object> get props => [photo];
}

class RemovePhotoEvent extends FileUploaderEvent {}

class GetPhotoEvent extends FileUploaderEvent {}

//class PhotoUploaderRecivedEvent extends PhotoUploaderEvent {}
