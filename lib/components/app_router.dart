
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:go_router/go_router.dart';
// import 'package:medipal/pages/ChatBot/chatBot.dart';
// import 'package:medipal/pages/Favorites/favorites.dart';
// import 'package:medipal/pages/Notification/notification.dart';
// import 'package:medipal/pages/Profile/profile.dart';
// import 'package:medipal/pages/Schedule/med_schedule.dart';
// import 'package:medipal/pages/Search/foodSearch.dart';

// import '../locator.dart';
// import '../pages/Home/home.dart';
// import '../pages/LogIn/login.dart';
// import '../pages/Register/register.dart';
// import '../pages/Settings/settings.dart';
// import '../pages/Start/intro.dart';
// import '../pages/Start/launch.dart';

// class AppRouter {

//   GoRouter router = GoRouter(
//     initialLocation: '/',
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) {
//           final isAuthenticated =
//               locator.get<FirebaseAuth>().currentUser != null;
//           if (!isAuthenticated) {
//             return const LaunchScreen();
//           } else {
//             return const IntroScreen();
//           }
//         },
//       ),
//       GoRoute(
//         path: '/login',
//         builder: (context, state) {
//           return const LogInScreen();
//         },
//       ),
//       GoRoute(
//         path: '/register',
//         builder: (context, state) {
//           return const RegisterScreen();
//         },
//       ),
//       GoRoute(
//         path: '/home',
//         builder: (context, state) {
//           return const Home();
//         },
//       ),
//       GoRoute(
//         path: '/search',
//         builder: (context, state) {
//           return const FoodSearch();
//         },
//       ),
//       GoRoute(
//         path: '/notifications',
//         builder: (context, state) {
//           return const Notifications();
//         },
//       ),
//       GoRoute(
//         path: '/profile',
//         builder: (context, state) {
//           return const Profile();
//         },
//       ),
//       GoRoute(
//         path: '/schedule',
//         builder: (context, state) {
//           return const MedicationSchedule();
//         },
//       ),
//       GoRoute(
//         path: '/chatbot',
//         builder: (context, state) {
//           return const ChatBot();
//         },
//       ),
//       GoRoute(
//         path: '/favorite',
//         builder: (context, state) {
//           return const Favorite();
//         },
//       ),
//       GoRoute(
//         path: '/settings',
//         builder: (context, state) {
//           return const SettingsScreen();
//         },
//       ),
//     ],
//   );
// }