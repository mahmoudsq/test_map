import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_task/final_data_screen/final_data_screen.dart';

import '../Componanets/default_button.dart';
import '../Componanets/default_textForm.dart';
import '../app_cubit/cubit.dart';
import '../constant.dart';

class AppForm extends StatefulWidget {
  const AppForm({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  FocusNode pin2FocusNode = FocusNode();

  @override
  void dispose() {
    pin2FocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.only(right: screenWidth * 0.1,left: screenWidth * 0.1),
        child: Column(
          children: [
            DefaultTextForm(
              controller: cubit.latController,
              labelText: 'Lat',
              readOnly: true,
            ),
            DefaultTextForm(
              controller: cubit.longController,
              labelText: 'Long',
             readOnly: true,
            ),
            DefaultTextForm(
              controller: cubit.nameController,
              labelText: 'Name',
              onSubmit: (value) {
                FocusScope.of(context).requestFocus(pin2FocusNode);
              },
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Insert Your Name';
                }
                return null;
              },
            ),
            DefaultTextForm(
              controller: cubit.phoneController,
              labelText: 'Mobile Number',
              maxLength: 11,
              type: TextInputType.phone,
              focusNode: pin2FocusNode,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Insert Mobile Number';
                }
                return null;
              },
            ),
            Row(
              children: [
                const Text(
                  'Male',
                  style:
                  TextStyle( color: Colors.grey),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: Gender.Male,
                  groupValue: cubit.gender,
                  onChanged:(Gender? value) => cubit.changeGender(value),
                ),
                const Text(
                  'Female',
                  style:
                  TextStyle(color: Colors.grey),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: Gender.Female,
                  groupValue: cubit.gender,
                  onChanged: (Gender? value) => cubit.changeGender(value),
                ),

              ],
            ),
            Row(
              children: [
                const Text(
                  'Check Box',
                  style: TextStyle(color: Colors.grey),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  //fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: cubit.isChecked,
                  onChanged: (value) => cubit.changeCheckbox(value),
                ),
              ],
            ),
            DefaultButton(
              width: screenWidth * 0.4,
              height: screenHeight * 0.07,
              text: 'Save Data',
              haveIcon: true,
              iconData: Icons.send,
              iconColor: Colors.white,
              buttonBackground: Colors.green,
              radius: 10,
              fontSize: screenWidth * 0.04,
              function: () {
                if (widget.formKey.currentState!.validate()) {
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>
                     FinalDataScreen(name: cubit.nameController.text, gender: cubit.gender!.index == 0 ? 'Male' : 'Female',
                         lat: cubit.latController.text, long: cubit.longController.text,
                         mobile: cubit.phoneController.text,checked: cubit.isChecked),));
                }
              },
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
