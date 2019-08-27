docker-compose down --remove-orphans
docker-compose up -d --build
docker-compose exec socketio_app php artisan key:generate
docker-compose exec socketio_app php artisan config:cache
