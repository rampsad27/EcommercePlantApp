import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/configs/extension/build_context_extension.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/bloc/emailsignin_bloc.dart';
import 'package:plant_app/ui/modules/theme/bloc/theme_bloc.dart';
import 'package:plant_app/ui/modules/theme/configs/app_theme.dart';
import 'package:plant_app/ui/modules/widgets/menuitems.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;
    return BlocListener<EmailSigninBloc, EmailSigninState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          context.go("/login");
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 50, 8, 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/img/p.png",
                height: 80,
                width: 80,
              ),
              const MenuItems(x: '/home', y: 'My Profile'),
              const MenuItems(x: '/home', y: 'My Address'),
              const MenuItems(x: '/home/mycart', y: 'My Order'),
              const MenuItems(x: '/home', y: 'My Favourite'),
              const MenuItems(x: '/home', y: 'Settings'),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<EmailSigninBloc>(context)
                        .add(LogInLogOutRequested());
                  },
                  child: Text(
                    "Log Out",
                    style: TextStyle(color: appColor.primarytext),
                  )),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.nightlight_outlined),
                  const SizedBox(width: 8),
                  const Text("Dark Mode"),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;

                        if (isDarkMode) {
                          context.read<ThemeBloc>().add(ThemeChangeRequested(
                              themeData: AppTheme.darkTheme()));
                        } else {
                          context.read<ThemeBloc>().add(ThemeChangeRequested(
                              themeData: AppTheme.lightTheme()));
                        }
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
