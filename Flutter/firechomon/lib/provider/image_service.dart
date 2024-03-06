import 'package:image_picker/image_picker.dart';

Future<XFile?> getImage() async {
  final ImagePicker picker = ImagePicker();
  // Seleccionamos una imagen
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  return image;
}