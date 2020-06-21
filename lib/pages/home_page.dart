import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uiinformationaboutplanets/constants/colors.dart';
import 'package:uiinformationaboutplanets/models/planets_info.dart';
import 'package:uiinformationaboutplanets/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _columnOfDropdown(context),
              _swiper(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _columnOfDropdown(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Explore',
            style: TextStyle(
              fontSize: 44,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left,
          ),
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text(
                  'Solar System',
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color(0x7cdbf1ff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
            onChanged: (value) {},
            icon: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset('assets/images/drop_down_icon.png'),
            ),
            underline: SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _swiper(BuildContext context) {
    return Container(
      height: 400,
      child: Swiper(
        itemCount: planets.length,
        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
        layout: SwiperLayout.STACK,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(bottom: 40),
          builder: DotSwiperPaginationBuilder(activeSize: 15, space: 5),
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              _infoPlanets(context, index),
              _imagePlanets(context, index),
            ],
          );
        },
      ),
    );
  }

  Widget _infoPlanets(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Stack(
                children: <Widget>[
                  _indexPlanets(context, index),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 60),
                      _namePlanets(context, index),
                      _solarSystem(context),
                      SizedBox(height: 30),
                      _rowOfMore(context, index),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _namePlanets(BuildContext context, int index) {
    return Text(
      planets[index].name,
      style: TextStyle(
        fontSize: 32,
        color: const Color(0xff47455f),
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _solarSystem(BuildContext context) {
    return Text(
      'Solar System',
      style: TextStyle(
        fontFamily: 'Avenir',
        fontSize: 23,
        color: primaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _rowOfMore(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, a, b) => DetailPage(
              planetInfo: planets[index],
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Know more',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 18,
              color: secondaryTextColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
          Icon(
            Icons.arrow_forward,
            color: secondaryTextColor,
          ),
        ],
      ),
    );
  }

  Widget _imagePlanets(BuildContext context, int index) {
    return Hero(
      tag: planets[index].position,
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          planets[index].iconImage,
          height: 200,
          width: 200,
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(36.0),
        ),
        color: navigationColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/images/menu_icon.png'),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                Text(
                  'Explore',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            IconButton(
              icon: Image.asset('assets/images/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/images/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _indexPlanets(BuildContext context, int index) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 80),
        child: Text(
          planets[index].position.toString(),
          style: TextStyle(
              fontSize: 150,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
