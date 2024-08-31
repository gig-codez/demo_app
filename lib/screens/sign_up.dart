import 'package:demo_app/widgets/form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  // form key
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              // ------
              FormFieldWidget(
                label: "Email",
                placeholder: "Enter your email address",
                controller: emailController,
              ),
              FormFieldWidget(
                label: "Password",
                placeholder: "e.g **********",
                controller: passwordController,
              ),
              FormFieldWidget(
                label: "Confirm Password",
                placeholder: "e.g **********",
                controller: confirmPasswordController,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    fixedSize: const Size(380, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: confirmPasswordController.text)
                          .then((user) {
                        // user.user!.sendEmailVerification();
                        if (user.user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Account created successfully"),
                            ),
                          );
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Passwords do not match"),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
