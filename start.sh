#!/bin/sh

echo "Starting Laravel setup..."

# Copy .env jika belum ada
if [ ! -f ".env" ]; then
    echo "Creating .env file..."
    cp .env.example .env
fi

# Install dependensi Laravel
echo "Installing dependencies..."
composer install --no-dev --optimize-autoloader

# Generate app key
echo "Generating application key..."
php artisan key:generate

# Jalankan migrasi & seed database hanya jika belum pernah dijalankan
if [ ! -f "storage/db_installed" ]; then
    echo "Running migrations..."
    php artisan migrate --force
    php artisan db:seed --force
    touch storage/db_installed
else
    echo "Database migration already applied. Skipping..."
fi

# Bersihkan cache Laravel
echo "Clearing cache..."
php artisan cache:clear
php artisan config:clear
php artisan route:clear

# Jalankan Laravel server
echo "Starting Laravel server..."
php artisan serve --host=0.0.0.0 --port=8001
