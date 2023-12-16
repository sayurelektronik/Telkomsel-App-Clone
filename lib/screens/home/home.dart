import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:telkomsel_app/screens/home/components/card_info_2.dart';
import 'package:telkomsel_app/screens/home/components/card_info_home_1.dart';
import 'package:telkomsel_app/screens/home/components/recomended_card.dart';
import 'package:telkomsel_app/screens/home/components/whatsnew_card.dart';
import 'package:telkomsel_app/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cards = [
    const CardInfoHome(),
    const CardInfoHome2(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget headerContent(String icon, String text) {
      return Container(
        margin: const EdgeInsets.only(top: 15, right: 10),
        padding: const EdgeInsets.fromLTRB(8, 5, 2, 5),
        decoration: const BoxDecoration(
          color: darkRedColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: boldText13.copyWith(color: whiteColor),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: whiteColor,
            )
          ],
        ),
      );
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hi Ardiansyah',
                  style: boldText15.copyWith(color: whiteColor),
                ),
                const Spacer(),
                const Icon(
                  Icons.qr_code_rounded,
                  color: whiteColor,
                  size: 28,
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset(
                  'assets/icons/icon-email.png',
                  width: 32,
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset(
                  'assets/icons/icon-help.png',
                  width: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  '08563330639',
                  style: boldText15.copyWith(color: whiteColor),
                ),
                const SizedBox(
                  width: 7,
                ),
                Image.asset(
                  'assets/icons/icon-plus.png',
                  width: 14,
                )
              ],
            ),
            Row(
              children: [
                headerContent('assets/icons/icon-love.png', '19 Poin'),
                headerContent('assets/icons/icon-star.png', 'Daily Check In'),
              ],
            )
          ],
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 18 : 5,
        height: 5,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color:
              currentIndex == index ? whiteColor : whiteColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(4),
        ),
      );
    }

    Widget cardInfo() {
      int index = -1;
      return Column(
        children: [
          CarouselSlider(
            items: cards
                .map<Widget>((card) => Container(
                      child: card,
                    ))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                height: 333,
                enableInfiniteScroll: false,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cards.map((e) {
              index += 1;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget recomendedForYou() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45, left: 16, right: 16),
            child: Row(
              children: [
                Text(
                  'Recommended for you',
                  style: nunitoExtraBoldText18,
                ),
                const Spacer(),
                Text(
                  'See all',
                  style: regularText12.copyWith(color: blueColor),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                RecomendedCard(
                  title: 'Kuota Ketengan Unl...',
                  time: '29 Jun 2023 13:08:07',
                  price: 'Rp. 4.200',
                ),
                SizedBox(
                  width: 16,
                ),
                RecomendedCard(
                  title: 'Kuota Ketengan Unl...',
                  time: '30 Jun 2023 13:08:07',
                  price: 'Rp. 5.600',
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget whatsNew() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 14),
            child: Text(
              'Whats new ?',
              style: nunitoExtraBoldText18,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                WhatsNewCard(
                  image: 'assets/images/video.png',
                  text: 'Package',
                  title: 'Video Digital Subscription',
                ),
                SizedBox(
                  width: 16,
                ),
                WhatsNewCard(
                  image: 'assets/images/content-bg.png',
                  text: 'Poin',
                  title: 'Undi - undi Hepi',
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            recomendedForYou(),
            whatsNew(),
          ],
        ),
      );
    }

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.topRight,
          stops: [0.1, 0.8, 1],
          colors: [redColor, redColor, yellowColor],
        ),
      ),
      child: ScrollConfiguration(
        behavior: MyBehaviour(),
        child: ListView(
          children: [
            header(),
            cardInfo(),
            content(),
          ],
        ),
      ),
    ));
  }
}

class MyBehaviour extends ScrollBehavior {
  
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
