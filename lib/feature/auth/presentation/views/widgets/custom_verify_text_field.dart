import 'package:flutter/material.dart';

class OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final FocusNode? prevFocus;
  final ValueChanged<String> onChanged;

  const OtpBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
    this.prevFocus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 56,
      child: TextField(
        controller: controller,

        focusNode: focusNode,
        autofocus: false,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          onChanged(value);

          if (value.isNotEmpty) {
            nextFocus?.requestFocus();
          } else {
            prevFocus?.requestFocus();
          }
        },
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
class VerifyCodeInput extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final VoidCallback onChanged;

  const VerifyCodeInput({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return OtpBox(
          controller: controllers[index],
          focusNode: focusNodes[index],
          nextFocus: index < 5 ? focusNodes[index + 1] : null,
          prevFocus: index > 0 ? focusNodes[index - 1] : null,
          onChanged: (_) => onChanged(),
        );
      }),
    );
  }
}
