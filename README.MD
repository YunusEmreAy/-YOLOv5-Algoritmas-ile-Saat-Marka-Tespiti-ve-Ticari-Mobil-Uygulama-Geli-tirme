# Saat Markası Tanıma Projesi

Bu proje, saat markalarını otomatik olarak tanıyabilen bir nesne tespiti sistemi geliştirmeyi hedeflemektedir. Proje, YOLOv5 algoritmasını kullanarak eğitim verisi üzerinde model oluşturmayı, çeşitli veri ön işleme teknikleri uygulamayı ve bu modeli kullanıcı dostu bir mobil uygulamaya entegre etmeyi kapsamaktadır.

---

## Proje Hakkında

Geliştirilen sistem, kol saati fotoğraflarını analiz ederek markalarını yüksek doğrulukla tespit edebilmek için tasarlanmıştır. YOLOv5 nesne tespit algoritması, hız ve doğruluk açısından sağladığı avantajlarla bu proje için ideal bir seçim olmuştur. Mobil uygulama ise kullanıcıların kolayca fotoğraf yükleyip sonuç alabilmesi için Flutter çerçevesi ile geliştirilmiştir.

---

## Sistem Mimarisi

### 1. Veri Toplama ve Ön İşleme
- **Veri Kaynakları**: Kaggle ve Google Görseller'den saat markalarına ait çeşitli fotoğraflar toplanmıştır.
- **Veri Seti Detayları**:
  - 10 saat markasına ait toplam 2000 adet görsel.
  - Markalar: Audemars Piguet, Breguet, Breitling, Maurice Lacroix, Omega, Patek Philippe, Rado, Rolex, TISSOT, Vacheron Constantin.
  - Görseller, farklı açılardan ve aydınlatma koşullarında çekilmiştir.
  - Görsel formatı: PNG, ortalama boyutlar: 474x474 piksel.

### 2. Veri Artırma ve Kalite İyileştirme
- **Super-Resolution (Süper Çözünürlük)**: Görsellerin kalitesini artırmak için BSRGAN algoritması kullanılmıştır.
- **Geometrik Dönüşümler**: Veriyi çeşitlendirmek amacıyla öteleme (translation) gibi dönüşümler uygulanmıştır.
- **Veri Etiketleme**: LabelImg aracı kullanılarak veri setindeki saatler etiketlenmiştir.

---

## Algoritma ve Model Eğitimi

### 1. YOLOv5 Algoritması
- YOLOv5, hızlı ve doğru nesne tespiti sağlayan tek aşamalı bir derin öğrenme algoritmasıdır.
- **Temel Özellikler**:
  - **Hız**: YOLOv5, PyTorch tabanlı olması sayesinde hızlı eğitim ve çıkarım süreçleri sunar.
  - **Doğruluk**: Nesne tespiti için yüksek doğruluk oranı sağlar.
- **Eğitim Süreci**:
  - Model, belirli hiperparametrelerle eğitilmiştir.
  - Performans değerlendirmesi için Intersection over Union (IoU) ve doğruluk gibi metrikler kullanılmıştır.

### 2. Algoritma Karşılaştırmaları
- YOLOv3, YOLOv4 ve YOLOv5 algoritmaları incelenmiş ve hız/performans açısından en verimli olan YOLOv5 seçilmiştir.
- **Tablo 1: YOLO Algoritmaları Karşılaştırma Tablosu**:
  - YOLOv5: Daha yüksek doğruluk ve hız.
  - YOLOv4: Hızlı fakat YOLOv5'e kıyasla biraz daha düşük performans.
  - YOLOv3: Daha eski bir sürüm, daha düşük doğruluk.

---

## Mobil Uygulama Geliştirme

Mobil uygulama, kullanıcıların fotoğraf yüklemesine ve anlık olarak saat markasını tespit etmesine olanak tanır. Flutter çerçevesi kullanılarak hem Android hem de iOS platformları için modern bir kullanıcı arayüzü geliştirilmiştir.

### 1. Uygulama Özellikleri
- **Kullanıcı Dostu Arayüz**: Kullanıcılar, "Saat Seçmeye Hazır Mısın?" mesajı ile karşılanır ve kolayca fotoğraf yükleyebilir.
- **Fotoğraf Yükleme**: Galeriden saat fotoğrafı seçilerek sisteme yüklenir.
- **Marka Tanıma**: YOLOv5 modelinin çıkardığı marka ve doğruluk oranı kullanıcıya gösterilir.
- **Yeni Tespit**: Kullanıcılar yeni bir fotoğraf seçip işlem yapabilir.

### 2. Kullanılan Kütüphaneler
- **dart:io**: Giriş-çıkış işlemleri için.
- **flutter/material.dart**: Uygulama arayüzünü tasarlamak için.
- **flutter_riverpod**: Durum yönetimi için.
- **image_picker**: Galeriden fotoğraf seçmek için.
- **http**: Sunucuya veri gönderip almak için.
- **flutter_spinkit**: Yüklenme animasyonları için.

---

## Donanım ve Yazılım Gereksinimleri

### 1. Donanım
- **Eğitimde Kullanılan Bilgisayar**:
  - Marka: Lenovo Legion 5I Gen 7
  - Ekran Kartı: NVIDIA GeForce RTX 3070, 8 GB GDDR6
  - RAM: 16 GB DDR5
  - SSD: 512 GB PCIe
  - İşlemci: Intel Core i7-12700H

### 2. Yazılım
- **Python**: Veri analizi ve model eğitimi için.
- **OpenCV**: Görüntü işleme kütüphanesi.
- **PyTorch**: YOLOv5 modelinin eğitimi için.
- **Anaconda**: Python paket yönetimi için.
- **Flutter ve Dart**: Mobil uygulama geliştirme için.
- **Jupyter Notebook**: Eğitim sürecinde analizler için.

---

## Sonuçlar

Model, saat markalarını %99 doğrulukla tanımlamaktadır. Geliştirilen mobil uygulama, kullanıcılara kolay ve hızlı bir tespit hizmeti sunmaktadır. Yapay zeka ve mobil uygulama geliştirme alanlarındaki en son teknolojiler bir araya getirilerek başarılı bir çözüm elde edilmiştir.

