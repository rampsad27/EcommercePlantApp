import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/bloc/emailsignin_bloc.dart';
import 'package:plant_app/ui/modules/LoginRegister/GoogleSignin/googleauth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmailSigninBloc>().add(CheckLoggedInUser());
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      context
          .read<EmailSigninBloc>()
          .add(EmailSigninRequested(email: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<EmailSigninBloc, EmailSigninState>(
        listener: (context, state) {
          if (state is EmailSigninSuccess) {
            try {
              // UseGoRouterLogic here
              context.go("/home");
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => const HomeScreen()));
            } catch (e) {
              log(" HERE is ERROR: $e ");
            }
          } else if (state is EmailSigninFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/img/p.png',
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Icon(Icons.back_hand_sharp)
                    ],
                  ),
                  const Text(
                    "to PLANT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text(
                    "Hello there, login to continue",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Spacer(),
                      Text("Forgot Password ?"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _login();
                      // context.go('/home');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                      child: Text(
                    "Or continue with social account",
                    style: TextStyle(color: Colors.grey),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          GoogleSignInRepository googleSignInRepository =
                              GoogleSignInRepository();
                          await googleSignInRepository.signInWithGoogle();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 138, 138, 138),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.g_mobiledata),
                              Text("Google"),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 138, 138, 138),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook),
                              Text("Facebook"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Didn't have an account? "),
                      TextButton(
                        onPressed: () {
                          context.go(
                              "/register"); // Use correct route for registration
                        },
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
