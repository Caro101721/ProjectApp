import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInput = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.yellow),
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        hintText: 'Ingresar mensaje',
        filled: true,
        focusedBorder: outlineInput,
        enabledBorder: outlineInput,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
          icon: Icon(Icons.send_outlined),
        ),
      ),
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
        textController.clear();
      },
    );
  }
}
