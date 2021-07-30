import 'package:get/get.dart';

class MangaController extends GetxController {
  int? id;
  MangaController({this.id});
  RxBool isLoading = true.obs;
}
