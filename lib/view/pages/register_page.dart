import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_chat_app/view/pages/login_page.dart';
import 'package:minimal_chat_app/view/pages/tab_page.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          body: Form(
            key: authProvider.formkeyRegister,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconlyBroken.chat,
                      size: 60,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Let's Create Your Account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        controller: authProvider.emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            IconlyBroken.message,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.secondary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 25),
                          hintText: 'Email',
                        ),
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            authProvider.validateEmail(value!),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        controller: authProvider.passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            IconlyBroken.lock,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              authProvider.showPassword();
                            },
                            icon: authProvider.isShown
                                ? Icon(
                                    Icons.remove_red_eye,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                : Icon(
                                    Icons.remove_red_eye_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.secondary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 25),
                          hintText: 'Password',
                        ),
                        obscureText: authProvider.isShown,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            authProvider.validatePassword(value!),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        controller: authProvider.confrimpasswordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            IconlyBroken.lock,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              authProvider.showPassword();
                            },
                            icon: authProvider.isShown
                                ? Icon(
                                    Icons.remove_red_eye,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                : Icon(
                                    Icons.remove_red_eye_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.secondary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 25),
                          hintText: 'Confirm Password',
                        ),
                        obscureText: authProvider.isShown,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            authProvider.validatePassword(value!),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                            onPressed: () async {
                              bool signedup =
                                  await authProvider.signupWithEmailAndPassword(
                                      email: authProvider.emailController.text,
                                      password:
                                          authProvider.passwordController.text);
                              if (signedup) {
                                authProvider.clearFields();
                                Get.to(() => TabPage(),
                                    transition: Transition.cupertino);
                              }
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ))),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ? ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              authProvider.clearFields();
                              Get.offAll(() => LoginPage());
                            },
                            child: Text(
                              'Login Now',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
