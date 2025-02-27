import 'package:project/helper/utils/generalImports.dart';

Widget editPhoneBoxBoxWidget(
  BuildContext context,
  TextEditingController edtController,
  // Function validationFunction,
  String label, {
  bool? isLastField,
  String? number,
  bool? isEditable = true,
  TextInputAction? optionalTextInputAction,
  int? minLines,
  int? maxLines,
  int? maxLength,
  FloatingLabelBehavior? floatingLabelBehavior,
  void Function()? onTap,
  bool? readOnly,
}) {
  return IntlPhoneField(
    controller: edtController,
    dropdownTextStyle: TextStyle(color: ColorsRes.mainTextColor),
    style: TextStyle(color: ColorsRes.mainTextColor),
    dropdownIcon: Icon(
      Icons.keyboard_arrow_down_rounded,
      color: ColorsRes.mainTextColor,
    ),
    dropdownIconPosition: IconPosition.trailing,
    readOnly: readOnly ?? false,
    flagsButtonMargin: EdgeInsets.only(left: 10),
    initialCountryCode: "IN",
    onChanged: (value) {
      print('full number is ${value.completeNumber}');
      number = value.completeNumber;
    },
    textInputAction: optionalTextInputAction ??
        (isLastField == true ? TextInputAction.done : TextInputAction.next),
    decoration: InputDecoration(
      hintStyle: TextStyle(color: Theme.of(context).hintColor),
      counterText: "",
      alignLabelWithHint: true,
      fillColor: Theme.of(context).cardColor,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: ColorsRes.appColor,
          width: 1,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: ColorsRes.subTitleMainTextColor.withOpacity(0.5),
          width: 1,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: ColorsRes.appColorRed,
          width: 1,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: ColorsRes.subTitleMainTextColor,
          width: 1,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: ColorsRes.subTitleMainTextColor.withOpacity(0.5),
          width: 1,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      labelText: label,
      labelStyle: TextStyle(color: ColorsRes.subTitleMainTextColor),
      isDense: true,
      floatingLabelStyle: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) {
          final Color color = states.contains(WidgetState.error)
              ? Theme.of(context).colorScheme.error
              : ColorsRes.appColor;
          return TextStyle(color: color, letterSpacing: 1.3);
        },
      ),
      floatingLabelBehavior:
          floatingLabelBehavior ?? FloatingLabelBehavior.auto,
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );
}
