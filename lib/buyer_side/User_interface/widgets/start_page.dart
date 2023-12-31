import 'package:flutter/material.dart';
import 'package:ow_tech_core/buyer_side/User_interface/widgets/particle_generator.dart';
import 'package:ow_tech_core/buyer_side/User_interface/widgets/profile_page.dart';

import '../../models/user.dart';
import '../../resources/SPreferences_data.dart';
import '../views/waiting_page.dart';
import 'layout_page.dart';

class StartPage extends StatefulWidget {
  final User? user;
  const StartPage({
    super.key,
    this.user,
  });

  @override
  State<StartPage> createState() => _StartPageState();
}

enum PagesStates { init, login, waiting, profile }

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  SPreferencesData prefs = SPreferencesData();
  late PagesStates _currentPage;

  void setSubmit(bool action) {
    _currentPage = action ? PagesStates.login : PagesStates.init;
    setState(() {});
  }

  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _validationOutAnimation;
  late Animation<double> _endingAnimation;

  @override
  void initState() {
    _currentPage = PagesStates.init;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
    _progressAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0, 0.65),
    );
    _validationOutAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 0.9),
    );
    _endingAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.8, 0.9),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
        builder: (_, value, child) => Opacity(
          opacity: value,
          child: child,
        ),
        child: Stack(
          children: [
            WaitingPage(
              user: widget.user,
              resetUserProps: prefs.resetUserProps,
              setSubmit: setSubmit,
              progressAnimation: _progressAnimation,
              onAnimationStarted: () {
                _animationController.forward();
              },
              animationReset: () {
                _animationController.reset();
              },
            ),
            ParticleGenerator(
              validationOutAnimation: _validationOutAnimation,
              progressAnimation: _progressAnimation,
            ),
            ProfilePage(
                user: widget.user,
                resetUserProps: prefs.resetUserProps,
                endingAnimation: _endingAnimation),
          ],
        ),
      ),
    );
  }
}
