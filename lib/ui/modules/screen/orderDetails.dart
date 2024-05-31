import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Lottie.asset("assets/json/cart.json"),
          Lottie.asset("assets/json/b.json"),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              context.go("/home");
            },
            child: const Text("Continue shopping"),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
