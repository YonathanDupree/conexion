import 'package:conexion/app/modules/status/providers/status_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../ui/utils/dialog_util.dart';
import '../../../ui/utils/snackbar_util.dart';
import '../status_model.dart';

class StatusController extends GetxController {
  //TODO: Implement StatusController

  final statusprovider = StatusProvider();
  GetStorage box = GetStorage();
  RxBool isLoading = true.obs;
  String numeIden = "";
  final consRegi = "".obs;
  final tipoCupo = "".obs;
  final estaSoli = "".obs;
  final horaSoli = "".obs;
  final fechSoli = "".obs;
  final cargEmpl = "".obs;
  final nombEmpl = "".obs;
  final horaApro = "".obs;
  final cantCupo = "".obs;
  final anotObse = "".obs;

  final _dialog = DialogUtil();

  @override
  void onInit() {
    numeIden = box.read("numeIden");
    super.onInit();
  }

  @override
  void onReady() {
    getStatus(numeIden);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getStatus(String numeIden) async {
    late String title;
    late String message;

    try {
      Status? data = await statusprovider.getStatus(numeIden);
      consRegi.value = data!.consRegi.toString();
      tipoCupo.value = data.tipoCupo.toString();
      estaSoli.value = data.estaSoli.toString();
      horaSoli.value = data.horaSoli.toString();
      fechSoli.value = data.fechSoli.toString();
      cargEmpl.value = data.cargEmpl.toString();
      nombEmpl.value = data.nombEmpl.toString();
      horaApro.value = data.horaApro.toString();
      cantCupo.value = data.cantCupo.toString();
      anotObse.value = data.anotObse.toString();
      changeIsLoading(false);
    } catch (error) {
      title = "Error";
      message = error.toString();
      changeIsLoading(false);
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeIsLoading(bool data) {
    isLoading(data);
  }
}
