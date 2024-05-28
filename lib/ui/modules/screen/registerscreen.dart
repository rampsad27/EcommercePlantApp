import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/configs/di/extension/build_context_extension.dart';
import 'package:plant_app/ui/data/plantdata.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/bloc/emailsign_up_bloc.dart';
import 'package:plant_app/ui/modules/LoginRegister/GoogleSignin/googleauth_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _emailregisterController =
      TextEditingController();
  final TextEditingController _passwordregisterController =
      TextEditingController();
  final TextEditingController _passwordconfirmController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
              const Text("Register Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
              const Text("to PLANT",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const Text("Hello there, register to continue"),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _fnameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _lnameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailregisterController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordregisterController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordconfirmController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "I agree to the Terms & Conditions & Private policy set out by this site"),
              InkWell(
                onTap: () {
                  context.read<EmailsignUpBloc>().add(EmailSignUpRequested(
                        fname: _fnameController.text,
                        lname: _lnameController.text,
                        email: _emailregisterController.text,
                        password: _passwordconfirmController.text,
                        uuid: uuid.v4(),
                      ));
                  // String email = _emailregisterController.text;
                  // String password = _passwordregisterController.text;
                  // GoogleSignInRepository googleSignInRepository =
                  //     GoogleSignInRepository();
                  // googleSignInRepository.signUpWithEmailandPassword(
                  //     email, password);

                  context.go("/home");
                },
                child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.green,
                    child: const Center(
                        child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
               Center(
                  child: Text(
                "Or continue with social account",
                style: TextStyle(
                  color: appColor.primary,
                ),
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
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        context.go("/login");
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
