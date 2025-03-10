import 'package:project/helper/utils/generalImports.dart';

Widget editPhoneBoxBoxWidget(
  BuildContext context,
  TextEditingController edtController,
  FutureOr<String?> Function(PhoneNumber?)? validationFunction,
  String label, {
  bool? isLastField,
  Function(String)? onCountryCodeChanged,
  Function(String)? onNumberChanged,
  String? countryCode,
  bool? isEditable = true,
  TextInputAction? optionalTextInputAction,
  int? minLines,
  int? maxLines,
  int? maxLength,
  FloatingLabelBehavior? floatingLabelBehavior,
  void Function()? onTap,
  bool? readOnly,
}) {
  print('country code is ${countryCode}');
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
    initialCountryCode: countryCode ?? "IN",
    onChanged: (value) {
      print('full number is ${value.completeNumber}');
      onNumberChanged?.call(value.completeNumber);
      onCountryCodeChanged?.call(value.countryISOCode);
      print('country code is ${countryCode}');
    },
    onCountryChanged: (value) {
      print('country code is ${value.code}');
      onCountryCodeChanged?.call(value.code);
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
          color: Theme.of(context).primaryColor,
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
    validator: (value) {
      if (validationFunction != null) {
        if (validationFunction(value) == null) {
          print('mobile number is valid');
          return null;
        } else {
          print('iam here mobile');
          return "Invalid Phone Number";
        }
      }
      print('hhe hee hee');
      return null;
    },
  );
}
