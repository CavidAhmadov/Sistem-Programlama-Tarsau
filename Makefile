# ====================================================================
# SAKARYA ÜNİVERSİTESİ - SİSTEM PROGRAMLAMA DERSİ
# TARSAU ARŞİVLEME PROJESİ MAKEFILE DOSYASI
# ====================================================================

# 1. MAKROLAR (Ders Notu Sayfa 14)
# Sunumda gösterilen sembolik sabit standartları tanımlanmıştır.
COMPILER = gcc
CFLAGS   = -Wall -Wextra -std=gnu11 -O2
TARGET   = tarsau
OBJS     = tarsau.o

# Sahte Hedef Tanımlamaları
.PHONY: all clean test

# 2. BAĞIMLILIKLAR VE KURALLAR (Ders Notu Sayfa 8, 12, 13)

# Varsayılan Hedef
all: ${TARGET}

# Bağlama (Linker) Aşaması 
# Obje dosyalarını birleştirerek nihai çalıştırılabilir dosyayı üretir.
${TARGET}: ${OBJS}
	${COMPILER} ${CFLAGS} -o ${TARGET} ${OBJS}
	@echo "== Derleme islemi basari ile tamamlandi!.. =="

# Derleme (Compiler) Aşaması 
# Kaynak kodu (.c) bağımlılıklarına göre analiz edip obje dosyasına (.o) çevirir.
tarsau.o: tarsau.c
	${COMPILER} ${CFLAGS} -c tarsau.c

# Temizlik Kuralı (Ders Notu Sayfa 11, 12)
# Proje dizinini ilk haline getirir, üretilen geçici yapıları temizler.
clean:
	rm -f ${TARGET} ${OBJS} *.sau
	rm -rf d1 cikti_dizini
	@echo "== Temizlik islemi tamamlandi. =="

# Otomatik Test Kuralı
test: all
	@if [ -f test.sh ]; then \
		chmod +x test.sh; \
		./test.sh; \
	else \
		echo "test.sh dosyasi bulunamadi! Lutfen manuel test edin."; \
	fi