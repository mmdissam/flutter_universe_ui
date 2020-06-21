import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uiinformationaboutplanets/constants/colors.dart';
import 'package:uiinformationaboutplanets/models/planets_info.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            _listOfInfo(context),
            _iconImage(context),
            _positionOfPlanet(context),
            _backArrow(context),
          ],
        ),
      ),
    );
  }

  Widget _listOfInfo(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 250),
                _namePlanet(context),
                _nameOfSystem(context),
                Divider(color: Colors.black38),
                SizedBox(height: 20),
                _infoOfPlanet(context),
                SizedBox(height: 20),
                Divider(color: Colors.black38),
              ],
            ),
          ),
          _gallery(context),
          SizedBox(height: 10),
          _cardOfGallery(context),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _namePlanet(BuildContext context) {
    return Text(
      planetInfo.name,
      style: TextStyle(
        fontFamily: 'Avenir',
        fontSize: 56,
        color: primaryTextColor,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _nameOfSystem(BuildContext context) {
    return Text(
      'Solar System',
      style: TextStyle(
        fontFamily: 'Avenir',
        fontSize: 31,
        color: primaryTextColor,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _infoOfPlanet(BuildContext context) {
    return Text(
      // ?? means if no data return ''
      planetInfo.description ?? '',
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        height: 1.5,
        wordSpacing: 3,
        fontFamily: 'Avenir',
        fontSize: 20,
        color: contentTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _gallery(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Text(
        'Gallery',
        style: TextStyle(
          fontFamily: 'Avenir',
          fontSize: 25,
          color: const Color(0xff47455f),
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _cardOfGallery(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: planetInfo.images.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            // AspectRatio to make all different size at the same
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                planetInfo.images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _iconImage(BuildContext context) {
    return Positioned(
      right: -64,
      child: Hero(
          tag: planetInfo.position, child: Image.asset(planetInfo.iconImage)),
    );
  }

  Widget _positionOfPlanet(BuildContext context) {
    return Positioned(
      top: 30,
      left: 50,
      child: Text(
        planetInfo.position.toString(),
        style: TextStyle(
          fontFamily: 'Avenir',
          fontSize: 247,
          color: primaryTextColor.withOpacity(0.08),
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _backArrow(BuildContext context) {
    return Positioned(
      top: 20,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
