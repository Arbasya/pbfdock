# Gunakan image dasar PHP dengan FPM
FROM php:8.2-fpm

# Install dependencies yang diperlukan (Composer, unzip, curl, git)
RUN apt-get update && apt-get install -y unzip curl git \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory di dalam container
WORKDIR /var/www

# Copy semua file proyek Laravel ke dalam container
COPY . /var/www

# Beri izin eksekusi pada start.sh agar bisa dijalankan
RUN chmod +x /var/www/start.sh

# Jalankan start.sh saat container berjalan
CMD ["sh", "-c", "/var/www/start.sh && php artisan serve --host=0.0.0.0 --port=8001"]
