import 'package:percent_indicator/circular_percent_indicator.dart';
import '../containts.dart';

class CircularBMIincdicator extends StatelessWidget {
  const CircularBMIincdicator({
    super.key,
    required this.bmi,
  });

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        padding: const EdgeInsets.all(15),
        style: const NeumorphicStyle(
            intensity: 8,
            depth: 20,
            color: Color(0xffededed),
            boxShape: NeumorphicBoxShape.circle()),
        child: CircularPercentIndicator(
          animation: true,
          animationDuration: 1000,
          rotateLinearGradient: true,
          radius: 100,
          lineWidth: 20,
          percent: 0.8,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: const Color(0xffd8dfe5),
          progressColor: kaciveColor,
          center: Text(
            bmi,
            style: TextStyle(fontSize: 45, color: ktextColor),
          ),
        ),
      ),
    );
  }
}
