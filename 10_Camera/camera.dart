import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Ensure the plugin is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Get the list of available cameras
  final cameras = await availableCameras();

  // Pass the first available camera to the app
  runApp(MyApp(camera: cameras.first));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CameraHome(camera: camera),
    );
  }
}

class CameraHome extends StatefulWidget {
  final CameraDescription camera;

  const CameraHome({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraHomeState createState() => _CameraHomeState();
}

class _CameraHomeState extends State<CameraHome> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image == null)
              const Text('No image captured yet!',
                  style: TextStyle(fontSize: 18))
            else
              Image.file(_image!), // Display the captured image
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final imageFile = await Navigator.push<File?>(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TakePictureScreen(camera: widget.camera),
                  ),
                );

                if (imageFile != null) {
                  setState(() {
                    _image = imageFile;
                  });
                }
              },
              child: const Text('Take a Photo'),
            ),
          ],
        ),
      ),
    );
  }
}

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the CameraController
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Picture'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller); // Display the camera preview
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            // Take a picture and save it to a file
            final image = await _controller.takePicture();

            // Return the image path to the previous screen
            Navigator.pop(context, File(image.path));
          } catch (e) {
            print('Error capturing image: $e');
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}
