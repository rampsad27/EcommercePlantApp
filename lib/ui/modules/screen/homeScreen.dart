import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/configs/di/extension/build_context_extension.dart';
import 'package:plant_app/ui/data/plantdata.dart';
import 'package:plant_app/ui/modules/theme/bloc/theme_bloc.dart';
import 'package:plant_app/ui/modules/theme/configs/app_colors.dart';
import 'package:plant_app/ui/modules/widgets/bottomnav.dart';
import 'package:plant_app/ui/modules/widgets/listviewHorizontal.dart';
import 'package:plant_app/ui/modules/widgets/listviewVertical.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor.primary,
        leading: IconButton(
          onPressed: () {
            context.go('/menu');
          },
          icon: const Icon(Icons.border_all),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/home/mycart');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
              onPressed: () {
                Share.share("Share");
              },
              icon: const Icon(Icons.share)),
        ],
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Container(
            color: appColor.primary,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Good Morning",
                          // style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const Text("Find your favourite plants here"),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Text(
                              "Most Popular",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text("View all")
                          ],
                        ),
                        const SizedBox(height: 8),
                        ListviewHorizontal(
                          plantModelList: plantData,
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Text(
                              "My Favourite",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text("View all")
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                ListviewVertical(
                  plantModelList: plantData,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
