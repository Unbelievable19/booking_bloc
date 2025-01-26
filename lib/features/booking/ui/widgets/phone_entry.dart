import 'package:booking_bloc/features/booking/ui/widgets/field_wrapper.dart';
import 'package:booking_bloc/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneEntry extends StatefulWidget {
  const PhoneEntry(
      {super.key, required this.controller, required this.formKey});
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  @override
  State<PhoneEntry> createState() => _PhoneEntryState();
}

class _PhoneEntryState extends State<PhoneEntry> {
  final phoneMask = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##', type: MaskAutoCompletionType.lazy);
  bool firstChange = true;
  bool textChangedByUser = true;

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void _updateDisplayedPhoneNumber(String text) {
    setState(() {
      final String actualPhoneNumber =
          widget.controller.text.replaceAll(RegExp(r'[^\d]'), '');
      widget.controller.text = _completeToMask(widget.controller.text);
      phoneMask.formatEditUpdate(
          widget.controller.value,
          widget.controller.value.copyWith(
            text: actualPhoneNumber.isEmpty
                ? '*'
                : actualPhoneNumber.substring(1),
          ));
      widget.controller.selection = TextSelection.collapsed(
          offset: _getLastDigitIndex(widget.controller.text) + 1);
    });
  }

  String _completeToMask(String text) {
    String mask = '+7 (***) ***-**-**';
    return text + mask.substring(text.length);
  }

  int _getLastDigitIndex(String text) {
    for (int i = text.length - 1; i >= 0; i--) {
      if (RegExp(r'\d').hasMatch(text[i])) {
        return i;
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Focus(
            onFocusChange: (hasFocus) {
              if (!hasFocus) {
                widget.formKey.currentState?.validate();
              }
            },
            child: FieldWrapper(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: widget.controller,
                textCapitalization: TextCapitalization.none,
                inputFormatters: [phoneMask],
                validator: (value) => value!.length < 18 || value.contains('*')
                    ? 'Заполните поле.'
                    : null,
                onChanged: (String value) {
                  _updateDisplayedPhoneNumber(value);
                },
                decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    hintText: '+7 (***) ***-**-**',
                    errorStyle: null,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintStyle: TextStyle(
                      color: AppTheme.appColors.textFieldHintColor,
                    )),
              ),
            )));
  }
}
