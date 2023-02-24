import 'dart:ffi';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../../routes/app_pages.dart';
import '../../../../ui/themes/helper_theme.dart';
import '../../controllers/login_controller.dart';

class LayerThreeWidget extends StatefulWidget {
  const LayerThreeWidget({Key? key}) : super(key: key);
  @override
  State<LayerThreeWidget> createState() => _LayerThreeWidgetState();
}

class _LayerThreeWidgetState extends State<LayerThreeWidget> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        initState: (controller) {},
        builder: (controller) => Form(
            key: loginFormKey,
            child: SizedBox(
              height: 584,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 59,
                      top: 129,
                      child: SizedBox(
                        width: 310,
                        child: TextFormField(
                          controller: controller.codiUsuaController,
                          focusNode: controller.usernameFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          decoration: HelperTheme().textInputDecoration(
                            'login_username'.tr,
                            'login_enter_username'.tr,
                          ),
                          validator: (value) =>
                              controller.validatorUsername(value!),
                        ),
                      )),
                  Positioned(
                      left: 59,
                      top: 209,
                      child: SizedBox(
                        width: 310,
                        child: TextFormField(
                          controller: controller.clavUsuaController,
                          focusNode: controller.passwordFocusNode,
                          autocorrect: false,
                          obscureText: true,
                          decoration: HelperTheme().textInputDecoration(
                            'login_password'.tr,
                            'login_enter_password'.tr,
                          ),
                          validator: (value) =>
                              controller.validatorPassword(value!),
                        ),
                      )),
                  Positioned(
                    left: 59,
                    top: 289,
                    child: Container(
                      height: 50,
                      width: 310,
                      child: DropdownButtonFormField2(
                        scrollbarAlwaysShow: true,
                        decoration: InputDecoration(
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          fillColor: HelperTheme.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1.0)),
                        ),
                        hint: Text(
                          'login_enter_country'.tr,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 30,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        items: List.generate(
                          controller.countryList.length,
                          (index) => DropdownMenuItem<String>(
                            value: controller.countryList[index]["name"],
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      controller.countryList[index]["icon"]),
                                  radius: 16,
                                ),
                                const SizedBox(width: 10),
                                Text(controller.countryList[index]["name"]),
                              ],
                            ),
                          ),
                        ),
                        value: (controller.selectedCountry.value == "")
                            ? null
                            : controller.selectedCountry.value,
                        validator: (value) =>
                            controller.validatorCountry(value.toString()),
                        onChanged: (value) async {
                          String lang = 'PE';
                          if (value.toString() == 'Livva') {
                            lang = 'LIPE';
                          }
                          Get.updateLocale(Locale('es', lang));
                          String country = value.toString();
                          controller.updateCountry(country, lang);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 46,
                    top: 349,
                    child: Row(
                      children: [
                        Obx(() => Checkbox(
                              value: controller.isChecked.value,
                              checkColor: HelperTheme.primary,
                              activeColor: HelperTheme.black,
                              onChanged: (bool? value) {
                                controller.changeIsChecked(value!);
                              },
                            )),
                        Text(
                          "login_remember".tr,
                          style: HelperTheme.subTitleBlack,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 409,
                    right: 100,
                    child: Container(
                      decoration: HelperTheme().buttonBoxDecoration(),
                      width: controller.buttonwidth,
                      child: ElevatedButton(
                          style: HelperTheme().buttonStyleLogin(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10.0),
                              Text(
                                'login_enter'.tr,
                                style: HelperTheme.textButtonBlackXl,
                              )
                            ],
                          ),
                          onPressed: () async {
                            await controller.login(loginFormKey);
                          }),
                    ),
                  ),
                  Positioned(
                    right: 110,
                    top: 469,
                    child: GestureDetector(
                      onTap: () async {
                        Get.toNamed(Routes.FORGOT);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "login_forgot_password".tr,
                                  style: HelperTheme.labelBlackLgUnder),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 160,
                    top: 480,
                    child: Center(
                      child: Image(
                          image: AssetImage('assets/images/azzorti_login.png'),
                          width: 80,
                          height: 80),
                    ),
                  ),
                ],
              ),
            )));
  }
}
