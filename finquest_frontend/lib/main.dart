import 'package:flutter/material.dart';

// Splash Screens
import 'pages/splash/splash_page.dart';
import 'pages/splash/onboarding_page_1.dart';
import 'pages/splash/onboarding_page_2.dart';
import 'pages/splash/onboarding_page_3.dart';

// Auth Screens
import 'pages/auth/sign_in_page.dart';
import 'pages/auth/sign_up_page.dart';
import 'pages/auth/reset_password_page.dart';
import 'pages/auth/onboarding_form_page.dart';

// Home Tabs
import 'pages/home/home_page.dart';
import 'pages/home/dashboard_page.dart';
import 'pages/home/analytics_page.dart';
import 'pages/home/leaderboard_page.dart';
import 'pages/home/transactions_page.dart';

// Features
import 'pages/features/add_expense_page.dart';
import 'pages/features/sms_permission_page.dart';
import 'pages/features/ai_budget_coach_page.dart';

// Profile
import 'pages/profile/profile_page.dart';

void main() {
  runApp(const FinQuestApp());
}

class FinQuestApp extends StatelessWidget {
  const FinQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinQuest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/onboarding1': (context) => const OnboardingPage1(),
        '/onboarding2': (context) => const OnboardingPage2(),
        '/onboarding3': (context) => const OnboardingPage3(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/reset-password': (context) => const ResetPasswordPage(),
        '/onboarding-form': (context) => const OnboardingFormPage(),
        '/home': (context) => const HomePage(),
        '/dashboard': (context) => const DashboardPage(),
        '/analytics': (context) => const AnalyticsPage(),
        '/leaderboard': (context) => const LeaderboardPage(),
        '/transactions': (context) => const TransactionsPage(),
        '/add-expense': (context) => const AddExpensePage(),
        '/sms-permission': (context) => const SmsPermissionPage(),
        '/ai-coach': (context) => const AIBudgetCoachPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
