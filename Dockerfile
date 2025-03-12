# Gunakan image dasar PHP dengan FPM
FROM php:8.2-fpm

# Set working directory di dalam container
WORKDIR /var/www

# Copy semua file proyek Laravel ke dalam container
COPY . /var/www

# Beri izin eksekusi pada start.sh agar bisa dijalankan
RUN chmod +x /var/www/start.sh

# Jalankan start.sh saat container berjalan
# Gunakan image dasar PHP dengan FPM
FROM php:8.2-fpm

# Set working directory di dalam container
WORKDIR /var/www

# Copy semua file proyek Laravel ke dalam container
COPY . /var/www

# Beri izin eksekusi pada start.sh agar bisa dijalankan
RUN chmod +x /var/www/start.sh

# Jalankan start.sh saat container berjalan, lalu jalankan Laravel
CMD ["sh", "-c", "/var/www/start.sh && php artisan serve --host=0.0.0.0 --port=8001"]



