import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class MyWidget extends StatefulWidget {
  final List<String> pdfFilePaths;

  const MyWidget({Key? key, required this.pdfFilePaths});
  @override
  State<MyWidget> createState() => _MyWidgetState(pdfFilePaths: pdfFilePaths);
}

class _MyWidgetState extends State<MyWidget> {
  final List<String> pdfFilePaths;

  _MyWidgetState({required this.pdfFilePaths});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Generated PDFs",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[300],
      ),
      body: pdfFilePaths.isNotEmpty
          ? ListView.builder(
              itemCount: pdfFilePaths.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("PDF ${index + 1}"),
                  onTap: () async {
                    await OpenFile.open(pdfFilePaths[index]);
                  },
                );
              },
            )
          : Center(
              child: Text("No PDFs generated yet."),
            ),
    );
  }
}
