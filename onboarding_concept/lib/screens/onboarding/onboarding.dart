import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/screens/login/login.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/ripple.dart';

import 'pages/community/index.dart';
import 'pages/education/index.dart';
import 'pages/work/index.dart';
import 'widgets/header.dart';
import 'widgets/next_page_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_page_indicator.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;

  const Onboarding({Key key, this.screenHeight}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  AnimationController _cardsAnimationController;
  AnimationController _pageIndicatorAnimationController;
  AnimationController _rippleAnimationController;

  Animation<Offset> _slideAnimationLightCard;
  Animation<Offset> _slideAnimationDarkCard;
  Animation<double> _pageIndicatorAnimation;
  Animation<double> _rippleAnimation;

  int _currentPage = 1;

  bool get isFirstPage => _currentPage == 1;

  @override
  void initState() {
    super.initState();
    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: kCardAnimationDuration,
    );

    _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: kButtonAnimationDuration,
    );

    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: kRippleAnimationDuration,
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));

    _setCardsSlideOutAnimation();
    _setPageIndicatorAnimation();
  }

  @override
  void dispose() {
    _cardsAnimationController.dispose();
    _pageIndicatorAnimationController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
          pageNumber: 1,
          lightCardChild: CommunityLightCardContent(),
          darkCardChild: CommunityDarkCardContent(),
          textColumn: CommunityTextColumn(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      case 2:
        return OnboardingPage(
          pageNumber: 2,
          lightCardChild: EducationLightCardContent(),
          darkCardChild: EducationDarkCardContent(),
          textColumn: EducationTextColumn(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      case 3:
        return OnboardingPage(
          pageNumber: 3,
          lightCardChild: WorkLightCardContent(),
          darkCardChild: WorkDarkCardContent(),
          textColumn: WorkTextColumn(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _goToLogin() async {
    await _rippleAnimationController.forward();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Login(
          screenHeight: widget.screenHeight,
        ),
      ),
    );
  }

  Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(2);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
          _setCardsSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(3);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
        }

        break;
      case 3:
        if (_pageIndicatorAnimation.status == AnimationStatus.completed) {
          await _goToLogin();
        }
        break;
    }
  }

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        curve: Curves.easeOut,
        parent: _cardsAnimationController,
      ));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset(1.5, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        curve: Curves.easeOut,
        parent: _cardsAnimationController,
      ));
      _cardsAnimationController.reset();
    });
  }

  void _setCardsSlideOutAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-3.0, 0.0),
      ).animate(CurvedAnimation(
        curve: Curves.easeIn,
        parent: _cardsAnimationController,
      ));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-1.5, 0.0),
      ).animate(
        CurvedAnimation(
            curve: Curves.easeIn, parent: _cardsAnimationController),
      );
      _cardsAnimationController.reset();
    });
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    final multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween<double>(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
          curve: Curves.easeIn,
          parent: _pageIndicatorAnimationController,
        ),
      );
      _pageIndicatorAnimationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(kPaddingL),
              child: Column(
                children: [
                  Header(
                    onSkip: () async => await _goToLogin(),
                  ),
                  Expanded(
                    child: _getPage(),
                  ),
                  AnimatedBuilder(
                    animation: _pageIndicatorAnimation,
                    child: NextPageButton(
                      onPressed: () async => await _nextPage(),
                    ),
                    builder: (_, Widget child) {
                      return OnboardingPageIndicator(
                        angle: _pageIndicatorAnimation.value,
                        currentPage: _currentPage,
                        child: child,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _rippleAnimation,
            builder: (_, Widget child) {
              return Ripple(
                radius: _rippleAnimation.value,
              );
            },
          ),
        ],
      ),
    );
  }
}
