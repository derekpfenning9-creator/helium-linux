#!/bin/bash

# Set the package name and version
PACKAGE_NAME="your-package-name"
PACKAGE_VERSION="1.0.0"

# Set the architecture (e.g., amd64)
ARCHITECTURE="amd64"

# Create the necessary directories for the .deb package structure
mkdir -p $PACKAGE_NAME/DEBIAN
mkdir -p $PACKAGE_NAME/usr/local/bin

# Copy your files to the package structure (replace this with your actual files)
echo "This is a placeholder for your application" > $PACKAGE_NAME/usr/local/bin/$PACKAGE_NAME
chmod +x $PACKAGE_NAME/usr/local/bin/$PACKAGE_NAME

# Create the control file for the .deb package
cat <<EOF > $PACKAGE_NAME/DEBIAN/control
Package: $PACKAGE_NAME
Version: $PACKAGE_VERSION
Architecture: $ARCHITECTURE
Maintainer: Your Name <youremail@example.com>
Description: A short description of your package
EOF

# Build the .deb package
dpkg-deb --build $PACKAGE_NAME

# Optionally, clean up
rm -rf $PACKAGE_NAME
