import 'dart:io';
// import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_pdf_project/Dpdfs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

//get Image from galery and click image to camera
class _HomepageState extends State<Homepage> {
  final picker = ImagePicker();
  final pdf = pw.Document();
  List<File> Image_List = [];
  List<String> pdfFilePaths = [];

  Future getImage(ImageSource source) async {
    final pickFile = await picker.pickImage(source: source);
    setState(() {
      if (pickFile != null) {
        Image_List.add(File(pickFile.path));
      } else {
        print('No Image Select');
      }
    });
  }

  //Create pdf to uploaded photo

  Future<void> createPDF() async {
    for (var img in Image_List) {
      final imageCreate = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(imageCreate));
          }));
    }
  }

  //save pdf to your internal memory
  Future<void> savePDF() async {
    // var status = await Permission.storage.status;

    // // Check if permission is already granted
    // if (!status.isGranted) {
    //   // If not granted, request permission
    //   status = await Permission.storage.request();

    //   // Check if permission is granted after the request
    //   if (status.isGranted) {
    //     // Permission granted, proceed with saving the PDF
    //     _savePdfFile();
    //   } else {
    //     // Permission denied
    //     ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text("Storage permission denied.")));
    //   }
    // } else {
    //   // Permission already granted, proceed with saving the PDF
    //   _savePdfFile();
    // }
    _savePdfFile();
  }

  Future<void> _savePdfFile() async {
    try {
      final downloadDir =
          await getApplicationDocumentsDirectory(); // Use the correct directory
      final filePath =
          '${downloadDir.path}/${DateTime.now().microsecondsSinceEpoch}.pdf';
      final file = File(filePath);

      await file.writeAsBytes(await pdf.save());
      pdfFilePaths.add(filePath);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("PDF saved successfully: $filePath")));

      await OpenFile.open(filePath);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  // show flushbar to show message
  // void showPrintMessage(String title, String messages) {
  //   Flushbar(
  //     title: title,
  //     message: messages,
  //     duration: Duration(seconds: 4),
  //     icon: Icon(
  //       Icons.save_alt_outlined,
  //       color: Colors.blue,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () async {
              await createPDF();
              await savePDF();
            },
            icon: Icon(
              Icons.download_sharp,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyWidget(
                              pdfFilePaths: pdfFilePaths,
                            )));
              },
              icon: Icon(
                Icons.picture_as_pdf,
                color: Colors.white,
              ))
        ],
        title: Text(
          "Image to PDF",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[300],
      ),
      body: Image_List.isNotEmpty
          ? ListView.builder(
              itemCount: Image_List.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 400,
                  width: double.infinity,
                  margin: EdgeInsets.all(8),
                  child: Image.file(
                    Image_List[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            )
          : Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(20),
                        dashPattern: [10, 10],
                        color: Colors.black,
                        strokeWidth: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 520,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.red[50],
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_library,
                                  size: 60,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "No Image Is Select",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => getImage(ImageSource.gallery),
            backgroundColor: Colors.red,
            child: Icon(
              Icons.photo_library,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () => getImage(ImageSource.camera),
            backgroundColor: Colors.red,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => Homepage()));
              },
              backgroundColor: Colors.red,
              child: Icon(
                Icons.restart_alt,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
