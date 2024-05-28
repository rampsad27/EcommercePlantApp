import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/ui/modules/imagePicker_camera/bloc/camera_bloc.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svg/heart1.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {
                context.read<CameraBloc>().add(TakePictureRequested());
              },
              icon: const Icon(Icons.qr_code_scanner_outlined)),
          label: '',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
