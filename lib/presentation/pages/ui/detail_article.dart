part of 'pages.dart';
class DetailArticlePage extends StatefulWidget {
  static const routeName = "/article_Detail";
  final Articles article;
  const DetailArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  State<DetailArticlePage> createState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return Scaffold(

      appBar: AppBar(
          title:Text(widget.article.title, style: Theme.of(context).textTheme.headline6,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.article.urlToImage),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.article.description),
                  const Divider(color: Colors.grey,),
                  Text(
                    widget.article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                  const Divider(color: Colors.grey,),
                  Text('Date : ${widget.article.publishedAt}'),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, MoreNewsScreen.routeName, arguments: widget.article.url );
                  },
                      child: const Text("More..."))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
