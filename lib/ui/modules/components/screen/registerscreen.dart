import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/ui/modules/components/screen/homeScreen.dart';
import 'package:plant_app/ui/modules/components/screen/loginScreen.dart';

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                  // context.go(
                  //     "/onboarding1/onboarding2/onboarding3/login/register/home");
                },
                child: Container(
                    color: Colors.green,
                    child: const Center(child: Text("Register"))),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
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
