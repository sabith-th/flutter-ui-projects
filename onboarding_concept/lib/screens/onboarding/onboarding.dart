import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/screens/onboarding/pages/community/index.dart';
import 'package:onboarding_concept/screens/onboarding/pages/education/index.dart';
import 'package:onboarding_concept/screens/onboarding/pages/work/index.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/current_page_indicator.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/header.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/next_page_button.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/onboarding_page.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 1;

  bool get isFirstPage => _currentPage == 1;

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
          pageNumber: 1,
          lightCardChild: CommunityLightCardContent(),
          darkCardChild: CommunityDarkCardContent(),
          textColumn: CommunityTextColumn(),
        );
      case 2:
        return OnboardingPage(
          pageNumber: 2,
          lightCardChild: EducationLightCardContent(),
          darkCardChild: EducationDarkCardContent(),
          textColumn: EducationTextColumn(),
        );
      case 3:
        return OnboardingPage(
          pageNumber: 3,
          lightCardChild: WorkLightCardContent(),
          darkCardChild: WorkDarkCardContent(),
          textColumn: WorkTextColumn(),
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

  void _goToLogin() {
    // TODO: Replace with Login
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Container(),
      ),
    );
  }

  void _nextPage() {
    switch (_currentPage) {
      case 1:
        _setNextPage(2);
        break;
      case 2:
        _setNextPage(3);
        break;
      case 3:
        _goToLogin();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kPaddingL),
          child: Column(
            children: [
              Header(
                onSkip: _goToLogin,
              ),
              Expanded(
                child: _getPage(),
              ),
              OnboardingPageIndicator(
                currentPage: _currentPage,
                child: NextPageButton(
                  onPressed: _nextPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
