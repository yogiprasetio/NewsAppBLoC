part of 'pages.dart';

class OnlineClass extends StatelessWidget {
  const OnlineClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Food Market",
      backColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Icon(Icons.food_bank),
              ),
              Text(
                "Jadwal",
                style: blackFontStyle3,
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 75,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/img/Fizi.jpg"))),
          )
        ],
      ),
    );
  }
}
