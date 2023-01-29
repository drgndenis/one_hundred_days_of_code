import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscuringCharacter = '*';
  final _hintText = 'Password';
  bool _obscureText = true;

  void changeVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      obscureText: _obscureText,
      obscuringCharacter: _obscuringCharacter,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: _hintText,
        suffix: _onVisibility(),
      ),
    );
  }

  IconButton _onVisibility() {
    return IconButton(
        onPressed: changeVisibility,
        icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState: _obscureText
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 999),
        ));
    // Icon(_obscureText ? Icons.visibility : Icons.visibility_off));
  }
}
