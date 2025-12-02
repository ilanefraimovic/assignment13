#!/bin/bash
set -e

echo "Initializing databases..."

# Create fastapi_db if it doesn't exist
psql -U "$POSTGRES_USER" -tc "SELECT 1 FROM pg_database WHERE datname='fastapi_db'" | grep -q 1 || \
    psql -U "$POSTGRES_USER" -c "CREATE DATABASE fastapi_db;"

# Create fastapi_test_db if it doesn't exist
psql -U "$POSTGRES_USER" -tc "SELECT 1 FROM pg_database WHERE datname='fastapi_test_db'" | grep -q 1 || \
    psql -U "$POSTGRES_USER" -c "CREATE DATABASE fastapi_test_db;"

echo "Databases initialized."
