import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yapay_zeka_final/main.dart';
import 'package:image_picker/image_picker.dart';

class SelectFileWidget extends ConsumerWidget {
  const SelectFileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 16), () {
      //Navigator.pushNamed(context, "/fiyat");
    });

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 4.0,
              )),
              height: size.height * 0.4,
              width: size.width * 0.8,
              child: Image.file(
                File(ref.watch(imageProvider).path),
                fit: BoxFit.cover,
              ),
            ),
            ref.watch(markaProvider) == ""
                ? const Column(
                    children: [
                      SpinKitWave(
                        color: Colors.black87,
                        size: 60,
                      ),
                      Text(
                        "Yüklenen Saatin Markası Tespit Ediliyor\nLütfen Bekleyiniz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Marka tespit sonucu: " +
                            ref.watch(markaProvider).toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                color: Colors.amber,
                                width: 2,
                              ),
                            ),
                            elevation: 10,
                            shadowColor: Colors.amber,
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 15, bottom: 15),
                          ),
                          onPressed: () async {
                            XFile? file2 = await ImagePicker().pickImage(
                              source: ImageSource.gallery,
                            );

                            if (file2 != null) {
                              ref.read(markaProvider.notifier).state = "";
                              ref.read(imageProvider.notifier).state = file2;
                              Navigator.pushNamed(context, "/select");

                              File file = File(file2.path);
                              var request = http.MultipartRequest(
                                'POST',
                                Uri.parse(
                                    'https://api.furkanakyol.tech/api/Data/Image'),
                              );
                              request.files.add(
                                await http.MultipartFile.fromPath(
                                    'file', file.path),
                              );
                              var response = await request.send();
                              if (response.statusCode == 200) {
                                // Yanıt 200 ise (başarılı), vücudu oku
                                String responseBody =
                                    await response.stream.bytesToString();
                                ref.read(markaProvider.notifier).state =
                                    responseBody;
                              } else {}
                            }
                          },
                          child: const Text(
                            "Yeni Tespit Yapalım",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
