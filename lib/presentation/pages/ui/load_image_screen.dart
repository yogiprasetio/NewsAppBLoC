part of 'pages.dart';

class LoadImageScreen extends StatefulWidget {
  static const routeName = "/load_image-screen";
  @override
  State<LoadImageScreen> createState() => _LoadImageScreenState();
}

class _LoadImageScreenState extends State<LoadImageScreen> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  XFile? image;
  File? imageSaved;
  @override
  void initState() {
    super.initState();
    loadCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load Profile Picture from Camera"),
        backgroundColor: Colors.blueAccent[99],
      ),
      body: Container(
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 6 / 4,
                child: (controller == null)
                    ? const Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    await getImage();
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Yeeaayyy...',
                        message: "Foto Berhasil di simpan..",
                        contentType: ContentType.success,
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text("Save"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple, onPrimary: Colors.white),
                ),
                Container()
              ],
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: imageSaved == null
                  ? Text('No Image to be Priviewed')
                  : Image.file(imageSaved!),
              height: 300,
              width: 400,
            )
          ],
        ),
      ),
    );
  }

  void loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      debugPrint("No Cameras Found!!!!!!!!!!");
    }
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.camera);
    imageSaved = File(imagePicked!.path);
    String buttonText = "Ambil Foto";
    setState(() {
      buttonText = "Saving in Progress..";
    });
    final appDir = await pPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imagePicked.path);
    await GallerySaver.saveImage(imagePicked.path, toDcim: true);
  }
}
