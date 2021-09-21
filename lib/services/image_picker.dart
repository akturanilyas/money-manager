// import 'package:image_picker/image_picker.dart';

// class ImagePicker{
//   Future<void> getLostData() async {
//   final LostDataResponse response =
//       await picker.retrieveLostData();
//   if (response.isEmpty) {
//     return;
//   }
//   if (response.files != null) {
//     for(final XFile file in response.files) {
//       _handleFile(file);
//     }
//   } else {
//     _handleError(response.exception);
//   }
// }
// }