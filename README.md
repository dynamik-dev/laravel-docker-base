This is the base image used by [Dynamik Dev](https://dynamik.dev) for Laravel applications. It contains the PHP FPM configuration.

To use:

```dockerfile
FROM ghcr.io/dynamik-dev/laravel-base:php-8.2 as base
# ...
```