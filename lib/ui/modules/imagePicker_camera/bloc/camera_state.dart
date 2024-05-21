part of 'camera_bloc.dart';

sealed class CameraState {}

final class CameraInitial extends CameraState {}

final class CameraLoadInProgress extends CameraState {}

final class TakePicturePicked extends CameraState {
  final File? pickedImage;

  TakePicturePicked({this.pickedImage});

  @override
  List<Object?> get props => [pickedImage];
}

final class ImageAndFilePickerFailure extends CameraState {
  final String errorMessage;

  ImageAndFilePickerFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
