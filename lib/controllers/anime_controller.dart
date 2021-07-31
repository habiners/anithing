import 'package:get/get.dart';

class AnimeController extends GetxController {
  int? id;
  AnimeController({this.id});
  RxBool isLoading = true.obs;
}
