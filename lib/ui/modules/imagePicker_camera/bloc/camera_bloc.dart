import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraInitial()) {
    on<TakePictureRequested>((event, emit) async {
      emit(CameraLoadInProgress());
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? result =
            await picker.pickImage(source: ImageSource.camera);
        if (result != null) {
          emit(TakePicturePicked(pickedImage: File(result.path)));
        } else {
          emit(ImageAndFilePickerFailure(
              errorMessage: "User canceled the action"));
        }
      } catch (e) {
        emit(ImageAndFilePickerFailure(errorMessage: e.toString()));
      }
    });
  }
}
