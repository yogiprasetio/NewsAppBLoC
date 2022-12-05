part of 'pages.dart';

class MoreNewsScreen extends StatefulWidget {
  static const routeName ='/more_news';
  final String url;

  const MoreNewsScreen({Key? key, required this.url}):super(key: key);

  @override
  State<MoreNewsScreen> createState() => _MoreNewsScreenState();
}

class _MoreNewsScreenState extends State<MoreNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
