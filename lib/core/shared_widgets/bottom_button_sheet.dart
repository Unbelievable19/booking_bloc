import 'package:booking_bloc/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButtonSheet extends StatelessWidget {
  const BottomButtonSheet({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });
  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        color: context.theme.primaryColor,
        width: context.adaptiveWidth,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 27),
          child: SizedBox(
            height: 60,
            child: CupertinoButton(
                borderRadius: BorderRadius.circular(15),
                color: context.color.addressColor,
                onPressed: () => onPressed(),
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 16),
                )),
          ),
        ),
      ),
      const Divider(
        thickness: 1.5,
        height: 1,
      )
    ]);
  }
}
