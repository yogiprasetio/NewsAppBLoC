part of 'pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yu' Maem Yu",
          style: blackFontStyle2,
        ),
        backgroundColor: mainColor,
      ),
      body: ListView.builder(
        itemCount: mockTransactions.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodDetailsPage(
                            transaction: mockTransactions[index],
                        onBackButtonPressed: (){
                              Navigator.pop(context);
                        },
                          )));
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      mockTransactions[index].food.picturePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            mockTransactions[index].food.name,
                            style: blackFontStyle1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            mockTransactions[index].food.description,
                            style: greyFontStyle,
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
