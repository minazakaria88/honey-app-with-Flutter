import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key, required this.function,
  });
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,),
      child: Row(
        children: [
          const Text(
            'ليس لديك حساب؟',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          TextButton(
            onPressed: () {

            },

            child: const Text(
              'سجل الان ',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}