#!/usr/bin/env bash

# Exit on error
set -o errexit

# Install necessary gems
echo "Installing gems..."
bundle install

# Setup the database
echo "Setting up the database..."
bundle exec rails db:setup

# Run migrations
echo "Running migrations..."
bundle exec rails db:migrate

# Seed the database
echo "Seeding the database..."
bundle exec rails db:seed

echo "Build completed successfully!"