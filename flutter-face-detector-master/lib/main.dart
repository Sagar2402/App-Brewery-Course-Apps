import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:tflite/tflite.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _imageFile;
  List _outputs;
  List<Face> _faces;
  bool isLoading = false;
  ui.Image _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _getImage,
          child: Icon(Icons.add_a_photo),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : (_imageFile == null)
                ? Center(child: Text('no image selected'))
                : Center(

                    child: Column(
                    children: <Widget> [
                      SizedBox(
                      width: _image.width.toDouble(),
                      height: _image.height.toDouble(),
                      child: CustomPaint(
                        painter: FacePainter(_image, _faces),
                      ),
                    ),
                      Text(
                        "${_outputs[0]["label"]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          background: Paint()..color = Colors.white,
                        ),
                      ),

                    ]
                 ),

        ),
    );
  }

  _getImage() async {
    final imageFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      isLoading = true;
    });


    final image = FirebaseVisionImage.fromFile(File(imageFile.path));
    final faceDetector = FirebaseVision.instance.faceDetector();
    List<Face> faces = await faceDetector.processImage(image);

    if (mounted) {
      setState(() {
        _imageFile = File(imageFile.path);
        _faces = faces;
        _loadImage(File(imageFile.path));
      });
    }
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      isLoading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then((value) => setState(() {
          _image = value;
          isLoading = false;
        }));
  }
}

class FacePainter extends CustomPainter {
  final ui.Image image;
  final List<Face> faces;
  final List<Rect> rects = [];


  FacePainter(this.image, this.faces) {
    for (var i = 0; i < faces.length; i++) {
      print(faces.length);
      rects.add(faces[i].boundingBox);
    }
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.yellow;

    canvas.drawImage(image, Offset.zero, Paint());
    for (var i = 0; i < faces.length; i++) {
      canvas.drawRect(rects[i], paint);
    }

  }

  @override
  bool shouldRepaint(FacePainter old) {
    return image != old.image || faces != old.faces;
  }
}
