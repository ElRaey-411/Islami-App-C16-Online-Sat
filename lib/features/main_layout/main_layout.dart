import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/features/main_layout/hadith/hadith_tab.dart';
import 'package:islami_app_online_sat/features/main_layout/quran/quran_tab.dart';
import 'package:islami_app_online_sat/features/main_layout/radio/radio.dart';
import 'package:islami_app_online_sat/features/main_layout/tasbeh/tasbeh_tab.dart';
import 'package:islami_app_online_sat/features/main_layout/time/time_tab.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
    RadioTab(),
    TimeTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: tabs[selectedIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTab,
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: IconAssets.quran,
            isSelected: selectedIndex == 0,
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: IconAssets.hadith,
            isSelected: selectedIndex == 1,
          ),
          label: "Hadith",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: IconAssets.sebha,
            isSelected: selectedIndex == 2,
          ),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: IconAssets.radio,
            isSelected: selectedIndex == 3,
          ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: IconAssets.time,
            isSelected: selectedIndex == 4,
          ),
          label: "Time",
        ),
      ],
    );
  }

  Widget _buildIcon({required String icon, required bool isSelected}) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: ColorsManager.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ImageIcon(AssetImage(icon)),
          )
        : ImageIcon(AssetImage(icon));
  }

  void _onTab(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
