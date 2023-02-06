import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return SizedBox(
      height: 50.0,
      width: 200,
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField2(
            decoration: InputDecoration(
              fillColor: HelperTheme.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red, width: 2.0)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: const BorderSide(color: Colors.red, width: 2.0)),
            ),
            hint: const Text(
              'Agrega tu estado',
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 40,
            buttonPadding: const EdgeInsets.only(left: 0, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            items: List.generate(
              controller.faceItems.length,
              (index) => DropdownMenuItem<String>(
                value: controller.faceItems[index]["name"],
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(controller.faceItems[index]["icon"]),
                      radius: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(controller.faceItems[index]["name"]),
                  ],
                ),
              ),
            ),
            value: controller.estaUsua,
            validator: (value) {
              if (value == null) {
                return 'Por favor seleccionar su estado';
              }
            },
            onChanged: (value) async {
              controller.estaUsua = value.toString();
              await controller.saveEmotion();

              /*setState(() async {
                controller.selectedFace = value.toString();
                final Preferences = await SharedPreferences.getInstance();
                final String? nume_iden = Preferences.getString('nume_iden');


                final response = await _registrarEstado.getRegistrarEstado(
                    selectedFace!, nume_iden!);

                if (response != "") {
                  print(response);
                }
              });*/
            },
          ),
        ),
      ),
    );
  }
}
