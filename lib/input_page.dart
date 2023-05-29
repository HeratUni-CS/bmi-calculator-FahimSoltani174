import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_widget.dart';
import 'constant.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 175;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI System'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableWidget(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  color: (selectedGender == Gender.Male)
                      ? kActivCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                    iconData: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                ),
                ReusableWidget(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  color: (selectedGender == Gender.Female)
                      ? kActivCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                    iconData: FontAwesomeIcons.venus,
                    label: 'FeMale',
                  ),
                ),
              ],
            ),
          ),
          ReusableWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      'CM',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 1,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF888993),
                    thumbColor: Color(0XFFEB1555),
                    overlayColor: Color(0x27EB1555),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                    min: 120,
                    max: 210,
                  ),
                ),
              ],
            ),
            color: kActivCardColor,
          ),
          Expanded(
            child: Row(
              children: [
                ReusableWidget(
                  color: kActivCardColor,
                ),
                ReusableWidget(
                  color: kActivCardColor,
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            color: kButtonContainerColor,
            margin: EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}
