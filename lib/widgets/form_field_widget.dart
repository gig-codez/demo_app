import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  const FormFieldWidget({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            // number in html  type=number, type=email
            TextField(
              controller: controller,
              // innputType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: placeholder,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
