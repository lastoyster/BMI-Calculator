import '../containts.dart';
import '../widgets/circular_bmi_indicator.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.result,
    required this.bmi,
  }) : super(key: key);
  final String result;
  final String bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Results',
          style: TextStyle(color: ktextColor),
        ),
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: NeumorphicButton(
          padding: const EdgeInsets.all(5),
          onPressed: () => Navigator.of(context).pop(),
          style: const NeumorphicStyle(
              intensity: 1,
              depth: 2,
              color: Color(0xffededed),
              boxShape: NeumorphicBoxShape.circle()),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularBMIincdicator(bmi: bmi),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              result,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ktextColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
