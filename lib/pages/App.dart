import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:xtranet/widgets/single.dart';
import 'package:xtranet/widgets/slider_indicator.dart';
import 'package:xtranet/widgets/transformer.dart';
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //init page
  int _currentPage = 0;
  //init background image
  String bgImg;


//listen to change of pageview
  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    //Change image as per the weather type
    if(locationList[_currentPage].weatherType == 'Sunny') {
      bgImg = 'assets/sunny.jpg';
    } else if(locationList[_currentPage].weatherType == 'Night') {
      bgImg = 'assets/night.jpg';
    } else if(locationList[_currentPage].weatherType == 'Rainy') {
      bgImg = 'assets/rainy.jpg';
    } else if(locationList[_currentPage].weatherType == 'Cloudy') {
      bgImg = 'assets/cloudy.jpeg';
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Menu Clicked!'),
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              bgImg,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: EdgeInsets.only(top: 140, left: 15),
              child: Row(
                children: [
                  for(int i = 0; i<locationList.length; i++)
                    if( i == _currentPage )
                      SliderDot(true)
                    else
                      SliderDot(false)
                ],
              ),
            ),
            TransformerPageView(
              scrollDirection: Axis.horizontal,
              transformer: ScaleAndFadeTransformer(),
              viewportFraction: 0.8,
              onPageChanged: _onPageChanged,
              itemCount: locationList.length,
              itemBuilder: (ctx, i) => SingleWeather(i),
            ),
          ],
        ),
      ),
    );
  }
}

