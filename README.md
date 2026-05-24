# Sistem-Programlama-Tarsau
Bu projede Linux/Unix işletim sistemlerinde çalışan ve sıkıştırma işlemi yapmadan birden fazla metin dosyasını tek bir arşiv dosyasında birleştiren “tarsau” isimli bir arşivleme uygulaması geliştirilmiştir.
Programın temel amacı:
•	ASCII formatındaki metin dosyalarını tek bir .sau uzantılı arşiv dosyasında toplamak,
•	Daha sonra bu arşiv dosyasını tekrar açarak dosyaları eski halleriyle geri çıkarmaktır.
Program geliştirilirken C programlama dili kullanılmıştır. Sistem programlama dersinin amacı doğrultusunda dosya işlemleri, bellek yönetimi, komut satırı parametreleri, dizin işlemleri ve Linux dosya izinleri gibi konular aktif olarak kullanılmıştır.

1. Aşama: Proje Altyapısı ve Dosya Doğrulama (Milestone 1)
Açıklama: Proje temel yapısının kurulması, kütüphanelerin tanımlanması ve kural gereği sadece standart ASCII (0-127) metin dosyalarının kabul edilmesini sağlayan güvenlik mekanizmasının geliştirilmesi.

Kritik Fonksiyonlar: main(), is_ascii_text_file(), read_file_contents()


2. Aşama: Arşivleme ve Organizasyon Bölümü Tasarımı (Milestone 2)
Açıklama: Verilen girdilerin dinamik olarak bellek yönetimiyle (realloc) taranması, toplam boyut sınırının (200 MB) kontrol edilmesi ve metadatanın |dosya_adi,izin,boyut| formatında paketlenerek ardışık ham veriyle birlikte .sau dosyasına yazılması.

Kritik Fonksiyonlar: build_archive(), base_name_only()


3. Aşama: Arşiv Çözme ve Geri Yükleme Mantığı (Milestone 3)
Açıklama: Üretilen arşiv dosyasının ilk 10 baytlık sabit boyutlu başlığının okunması, organizasyon metninin ayrıştırılması (sscanf) ve dosyaların içerikleriyle birlikte orijinal Linux dosya izinleri (chmod) korunarak diske yazılması.

Kritik Fonksiyonlar: extract_archive(), parse_org_section(), ensure_directory()


4. Aşama: CLI Parametre Normalizasyonu ve Hata Yönetimi (Milestone 4)
Açıklama: Farklı terminal emülatörlerinde oluşabilecek geniş tire (–) hatalarının tolere edilmesi, girdi sınırlarının (Max 32 dosya) ve komut satırı argüman esnekliklerinin (opsiyonel hedef dizin gibi) nihai hale getirilmesi.

Kritik Fonksiyonlar: normalize_option()

