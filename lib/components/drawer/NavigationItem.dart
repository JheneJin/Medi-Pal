import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import '../../pages/ChatBot/chatBot.dart';
import '../../pages/Favorites/favorites.dart';
import '../../pages/Home/home.dart';
import '../../pages/Notification/notification.dart';
import '../../pages/Profile/profile.dart';
import '../../pages/Schedule/med_schedule.dart';
import '../../pages/Search/foodSearch.dart';
import '../../pages/Setting/setting.dart';


class NavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  NavigationItem({required this.page, required this.title, required this.icon});

  static List<NavigationItem> get items => [
        // 0
        NavigationItem(
            page: Home(), icon: Icon(UniconsLine.home), title: 'Home'),
        // 1
        NavigationItem(
            page: FoodSearch(),
            icon: Icon(UniconsLine.search),
            title: 'Food Search'),
        // 2
        NavigationItem(
            page: Notifications(),
            icon: Icon(UniconsLine.bell),
            title: 'Notifications'),
        // 3
        NavigationItem(
            page: Profile(email: ""),
            icon: Icon(UniconsLine.user_circle),
            title: 'Profile'),
        // 4
        NavigationItem(
            page: MedicationSchedule(),
            icon: Icon(UniconsLine.schedule),
            title: 'Schedules'),
        // 5
        NavigationItem(
            page: ChatBot(),
            icon: Icon(UniconsLine.comment_alt),
            title: 'Medi-Bot'),
        // 6
        NavigationItem(
            page: Favorite(),
            icon: Icon(UniconsLine.heart),
            title: 'Favorites'),
        // 7
        NavigationItem(
            page: SettingsScreen(),
            icon: Icon(UniconsLine.setting),
            title: 'Settings'),
      ];
}
