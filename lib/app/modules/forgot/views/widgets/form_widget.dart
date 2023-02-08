import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/themes/helper_theme.dart';
import '../../controllers/forgot_controller.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
      init: ForgotController(),
      initState: (controller) {},
      builder: (controller) {
        return Center(
          child: Form(
            key: forgotFormKey,
            child: Column(
              children: [
                const Center(
                  child: Image(
                      image: AssetImage('assets/icons/forgot.png'),
                      width: 120,
                      height: 120),
                ),
                const SizedBox(height: 15.0),
                Text(
                  "forgot_subtitle".tr,
                  style: HelperTheme.subTitleLigh,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: controller.numeIdenController,
                  focusNode: controller.numeidenFocusNode,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: HelperTheme().textInputDecoration(
                    'forgot_identity'.tr,
                    'forgot_enter_identity'.tr,
                  ),
                  validator: (value) => controller.validatornumeIden(value!),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: controller.clavUsuaController,
                  focusNode: controller.clavusuaFocusNode,
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: HelperTheme().textInputDecoration(
                    'forgot_password'.tr,
                    'forgot_enter_password'.tr,
                  ),
                  validator: (value) => controller.validatorclavUsua(value!),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: controller.repeClavController,
                  focusNode: controller.repeclavFocusNode,
                  autocorrect: false,
                  obscureText: true,
                  decoration: HelperTheme().textInputDecoration(
                    'forgot_confirm_password'.tr,
                    'forgot_confirm_enter_password'.tr,
                  ),
                  validator: (value) => controller.validatorrepeClav(value!),
                ),
                const SizedBox(height: 25.0),
                Container(
                  decoration: HelperTheme().buttonBoxDecoration(),
                  //width: controller.buttonwidth,
                  child: ElevatedButton(
                      style: HelperTheme().buttonStyleForgot(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10.0),
                          Text(
                            'forgot_next'.tr,
                            style: HelperTheme.textButtonBlackXl,
                          )
                        ],
                      ),
                      onPressed: () async {
                        await controller.forgot(forgotFormKey);
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
