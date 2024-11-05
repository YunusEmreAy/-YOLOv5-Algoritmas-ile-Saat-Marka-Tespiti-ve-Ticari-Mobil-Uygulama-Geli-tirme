import 'dart:io'; // Dosya ve ağ işlemleri için kullanılmaktadır.
import 'package:flutter/material.dart'; // Temel widgetleri kullanmak için dahil ettik.
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Durum yönetimi için dahil ettik.
import 'package:image_picker/image_picker.dart'; // Cihazın kamerasını ve galerisini kullanmak için dahil ettik.
import 'package:yapay_zeka_final/dosyaSec.dart'; // 2. sayfayı dahil ettik.
import 'package:http/http.dart'
    as http; // Http istekleri yapmak için kullandım.

// Sayfa kontrolcüsü oluşturmak için kullandık.
final controllerProvider = StateProvider((ref) => PageController(
      initialPage: 0, // İlk sayfayı temsil etmektedir.
      keepPage: true, // Sayfa konumunu hatırlamak için kullanılmaktadır.
    ));

// Görüntü dosyalarını temsil etmektedir.
final imageProvider = StateProvider((ref) => XFile(""));
final markaProvider = StateProvider<dynamic>((ref) => "");

void main(List<String> args) {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widegetın kullanıcı arayüzünü yönetmektedir.
  Widget build(BuildContext context) {
    return MaterialApp(
      // debug yazısını kaldırmaktadır.
      debugShowCheckedModeBanner: false,
      routes: {
        // Yönlendirme işlemleri gerçekleştirdik.
        "/": (context) => const InfoPage(),
        "/select": (context) => const SelectFileWidget(),
      },
    );
  }
}

class InfoPage extends ConsumerWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Scaffold temel sayfa yapımızı oluşturmaktadır.
    return Scaffold(
      // "PageView" sayfalar arasında yatay olarak kaydırılabilen widgettır.
      body: PageView(
        // "NeverScrollableScrollPhysics" manuel olarak sayfaların kaydırılmasını engellemektedir.
        physics: const NeverScrollableScrollPhysics(),
        controller: ref.watch(controllerProvider),
        children: const [
          FirstInfoPageWidget(),
          SecondInfoPageWidget(),
          ThirdPageWidget(),
        ],
      ),
    );
  }
}

class FirstInfoPageWidget extends ConsumerWidget {
  const FirstInfoPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // "size" ekran genişlik ve yükseklik değerlerini dinamik bir şekilde çekmek içink ullanılmaktadır.
    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromRGBO(240, 240, 240, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              height: size.height * 0.4,
              width: size.width * 0.8,
              child: Image.asset("assets/1.png")),
          const Text(
            "Saat Seçmeye Hazır Mısın ?",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(controllerProvider.notifier).state.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      side: BorderSide(
                        color: Color.fromARGB(255, 40, 40, 40),
                        width: 2,
                      )),
                  elevation: 10,
                  shadowColor: Colors.amber,
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.only(
                      bottom: 15, left: 40, right: 40, top: 15)),
              child: const Text(
                "Devam",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}

class SecondInfoPageWidget extends ConsumerWidget {
  const SecondInfoPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(
      context,
    ).size;

    return Container(
      color: const Color.fromRGBO(240, 240, 240, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: size.height * 0.4,
              width: size.width * 0.6,
              child: Image.asset("assets/2.png")),
          const Text(
            "Sisteme Fotoğraf Yüklemek için\n\t\t\t\t\t\t\t\tSon Bir Adım Kaldı :)",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  side: BorderSide(
                    color: Colors.amber,
                    width: 2,
                  )),
              elevation: 10,
              shadowColor: Colors.amber,
              backgroundColor: Colors.black,
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 15, bottom: 15),
            ),
            onPressed: () {
              ref.read(controllerProvider.notifier).state.animateToPage(2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            },
            child: const Text(
              "Devam",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ThirdPageWidget extends ConsumerWidget {
  const ThirdPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromRGBO(240, 240, 240, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: size.height * 0.4,
              width: size.width * 0.8,
              child: Image.asset("assets/3.png")),
          const Text(
            "Saat Markasını Tespit Edelim :)",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                ref.read(imageProvider.notifier).state = file2;
                Navigator.pushNamed(context, "/select");

                File file = File(file2.path);
                var request = http.MultipartRequest(
                  'POST',
                  Uri.parse('https://api.furkanakyol.tech/api/Data/Image'),
                );
                request.files.add(
                  await http.MultipartFile.fromPath('file', file.path),
                );
                var response = await request.send();
                if (response.statusCode == 200) {
                  // Yanıt 200 ise (başarılı), vücudu oku
                  String responseBody = await response.stream.bytesToString();
                  print(
                      "Serverdan gelen yanıt: $responseBody"); // Serverdan dönen marka bilgisi

                  ref.read(markaProvider.notifier).state = responseBody;
                } else {}
              }
            },
            child: const Text(
              "Başla",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
