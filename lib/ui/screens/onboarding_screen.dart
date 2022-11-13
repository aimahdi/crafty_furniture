import 'package:flutter/material.dart';

import './sign_in_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  int _index = 0;

  final List<Widget> _pages = [
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              'assets/images/image_view_experience_furniture.png'),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'View And Experience Furniture With The Help Of Augmented Reality',
            style: TextStyle(
                color: Color(0xff101817),
                fontFamily: 'Switzer',
                fontWeight: FontWeight.w500,
                fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              'assets/images/image_design_your_space.png'),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Design Your Space With Augmented Reality By Creating Room',
            style: TextStyle(
                color: Color(0xff101817),
                fontFamily: 'Switzer',
                fontWeight: FontWeight.w500,
                fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              'assets/images/image_explore_world_class_top_furniture.png'),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Explore World Class Top Furnitures As Per Your Requirements & Choice',
            style: TextStyle(
                color: Color(0xff101817),
                fontFamily: 'Switzer',
                fontWeight: FontWeight.w500,
                fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var imageAndTextBox = SizedBox(
      height: 500,
      child: PageView(
        onPageChanged: (int index) {
          setState(() {
            _index = index;
          });
        },
        controller: _pageController,
        children: _pages,
      ),
    );

    var dotIndicator = SizedBox(
      height: 5,
      child: Center(
        child: ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            itemBuilder: (context, dotIndex) {
              return Container(
                width: 5,
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: dotIndex == _index
                      ? const Color(0xff0c8a7b)
                      : const Color(0xffbdd3d0),
                ),
              );
            }),
      ),
    );

    var skipAndNextButton = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                const Color(0xff828a89),
              ),
            ),
            child: const Text(
              'Skip',
              style:
              TextStyle(fontSize: 18, fontFamily: 'Switzer'),
            ),
          ),
          CircleAvatar(
            backgroundColor: const Color(0xff0c8a7b),
            radius: 30,
            child: IconButton(
              onPressed: () {
                debugPrint(_index.toString());
                if (_index < 2) {
                  setState(() {
                    _index++;
                    _pageController.nextPage(
                        duration: const Duration(microseconds: 1),
                        curve: Curves.easeIn);
                  });
                }
              },
              icon: const Icon(
                Icons.navigate_next,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );

    var getStartedButton = Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            primary: const Color(0xff0c8a7b),
            textStyle: const TextStyle(
                fontFamily: 'Switzer',
                fontWeight: FontWeight.w600,
                fontSize: 16)),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Get Started'),
        ),
      ),
    );

    var footer =  _index < 2
        ? skipAndNextButton
        : getStartedButton;



    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  imageAndTextBox,
                  const SizedBox(
                    height: 10,
                  ),
                  dotIndicator
                ],
              ),
            ),
           footer
          ],
        ),
      ),
    );
  }
}
