# Use an official Flutter Docker image as a base
FROM cirrusci/flutter:latest

# Set the working directory in the container
WORKDIR /app

# Copy the pubspec.* files and get dependencies to cache them
COPY pubspec.* ./

# RUN flutter pub get

# Copy the entire project
COPY . .
RUN flutter pub get
# Build the Flutter app for release
# RUN flutter build apk --release

# Specify the command to run on container startup
# CMD ["flutter", "run", "--release"]
