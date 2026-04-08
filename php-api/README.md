# PHP API (XAMPP)

## Installation

1. Copier le dossier `php-api` dans `C:\xampp\htdocs\cuisinefacile\php-api`
2. Créer un fichier `C:\xampp\htdocs\cuisinefacile\php-api\.env` avec la config DB.
3. Importer `schema_mysql.sql` dans phpMyAdmin.

## Variables (.env)

```env
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=cuisinefacile
DB_USERNAME=root
DB_PASSWORD=
ADMIN_EMAILS=admin@cuisine.africa
```

## Endpoints

- GET `/recipes`
- GET `/recipes/{id}`
- POST `/users/upsert`
- GET `/users/by-email?email=`
- GET `/users/email-exists?email=`
- GET `/admin/is-admin-email?email=`
- GET `/cart?email=`
- POST `/cart/save`
- POST `/cart/delete`
- POST `/orders/create`
- GET `/orders/by-user?email=`
- GET `/admin/orders` (header `X-Admin-Email`)
- POST `/admin/orders/status` (header `X-Admin-Email`)
- GET `/admin/users` (header `X-Admin-Email`)
- POST `/admin/users/delete` (header `X-Admin-Email`)
- POST `/admin/recipes/create|update|delete` (header `X-Admin-Email`)
