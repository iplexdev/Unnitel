import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Color primaryGreen = Color(0xff416d6d);
List<Map> drawerItems=[
  {
    'icon': FontAwesomeIcons.home,
    'title' : 'Home'
  },
  {
    'icon': FontAwesomeIcons.equals,
    'title' : 'Packages'
  },
  {
    'icon': FontAwesomeIcons.wifi,
    'title' : 'Devices'
  },
  {
    'icon': FontAwesomeIcons.user,
    'title' : 'My Account'
  },
  {
    'icon': FontAwesomeIcons.cog,
    'title' : 'Settings'
  },
  {
    'icon': FontAwesomeIcons.signOutAlt,
    'title' : 'Sign Out'
  },
];
// For List Of Packages
List<Map> packagesList=[
  {
    'title': 'Global',
    'price' : '05.00',
    'packageData' : '01GB',
    'action' : 'Buy Now'

  },
  {
    'title': 'Asia Lite',
    'price' : '10.00',
     'packageData' : '03GB',
     'action' : 'Buy Now'
  },
   {
    'title': 'Global',
    'price' : '05.00',
     'packageData' : '01GB',
     'action' : 'Buy Now'
  },
];
// Settings List 
List<Map> settingsList =[
  {
    'image': 'assets/images/wifi_icon.png',
    'title': 'abc',
  },
  {
    'image': 'assets/images/wifi_icon.png',
    'title': 'abc',
  },
  {
    'image': 'assets/images/wifi_icon.png',
    'title': 'abc',
  },
  {
    'image': 'assets/images/wifi_icon.png',
    'title': 'abc',
  },
];
