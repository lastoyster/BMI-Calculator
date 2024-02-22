import '/calculation_brain.dart';
import '/screens/page_result.dart';
import '/widgets/age_weight_card.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../containts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender = Gender.male;
  void selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  double height = 0;
  int age = 1;
  int weight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  selectGender(Gender.male);
                },
                child: reuseableGenderCard(
                    context, 'Male', selectedGender == Gender.male),
              ),
              GestureDetector(
                onTap: () {
                  selectGender(Gender.female);
                },
                child: reuseableGenderCard(
                    context, 'Female', selectedGender == Gender.female),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              heightSlider(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.53,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueSelector(
                      label: 'Weight',
                      value: weight,
                      onIncrement: () {
                        setState(() {
                          if (weight < 200) {
                            weight++;
                          }
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          if (weight < 200) {
                            weight--;
                          }
                        });
                      },
                    ),
                    ValueSelector(
                      label: 'Age',
                      value: age,
                      onIncrement: () {
                        setState(() {
                          if (age < 100) {
                            age++;
                          }
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          if (age > 1) {
                            age--;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          NeumorphicButton(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.35,
                right: MediaQuery.of(context).size.width * 0.35,
                top: 15,
                bottom: 15),
            onPressed: () {
              CalucutationBrain calc =
                  CalucutationBrain(height: height, weight: weight);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmi: calc.calucutateBMI(), result: calc.result()),
                ),
              );
            },
            style: NeumorphicStyle(color: kaciveColor),
            child: Text(
              'Let,s Begin',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Neumorphic heightSlider(BuildContext context) {
    return Neumorphic(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width * 0.36,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Height',
              style: TextStyle(
                color: ktextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: SfSliderTheme(
                data: SfSliderThemeData(
                    activeLabelStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    inactiveLabelStyle:
                        TextStyle(color: ktextColor, fontSize: 15)),
                child: SfSlider.vertical(
                  activeColor: kaciveColor,
                  min: 100,
                  max: 230.0,
                  value: height,
                  interval: 20,
                  enableTooltip: true,
                  tooltipPosition: SliderTooltipPosition.right,
                  showTicks: true,
                  showLabels: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    setState(() {
                      height = value;
                    });
                  },
                  thumbIcon: NeumorphicIcon(Icons.circle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Neumorphic reuseableGenderCard(
      BuildContext context, String title, bool isSelected) {
    return Neumorphic(
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          intensity: 0.9,
          depth: 3,
          shape: NeumorphicShape.flat,
          color: isSelected ? kaciveColor : null),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(18),
        child: Text(title),
      ),
    );
  }
}

enum Gender {
  male,
  female,
}
