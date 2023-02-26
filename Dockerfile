# Stage 1 - Install dependencies and build the app
FROM therdm/flutter_ubuntu_arm:latest AS builder
#FROM cirrusci/flutter AS builder
#FROM ubuntu:20.04 AS builder

#RUN apt-get update
#RUN apt-get install -y bash curl file git unzip xz-utils zip libglu1-mesa
#RUN apt-get clean
#
# Clone the flutter repo
#RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
# RUN /usr/local/flutter/bin/flutter doctor -v
#ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Change stable channel
#RUN flutter channel stable

# Enable web capabilities
#RUN flutter config --enable-web
#RUN flutter upgrade
#RUN flutter pub global activate webdev

#RUN flutter doctor -v

# Copy files to container and build
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN flutter pub get
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:stable-alpine AS runner

COPY default.conf /etc/nginx/conf.d
# COPY package.json /usr/share/nginx/html
COPY --from=builder /app/build/web /usr/share/nginx/html




# Install Operating system and dependencies
#FROM ubuntu:18.04
#
#RUN apt-get update
#RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3
##RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
#RUN apt-get clean
#
## download Flutter SDK from Flutter Github repo
#RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
#
## Set flutter environment path
#ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
#
#
#RUN flutter channel stable
#RUN flutter --version
#
## Run flutter doctor and get thedart sdks downloaded
#RUN flutter doctor
##RUN git config --global http.sslVerify false
## Enable flutter web
#
#RUN flutter upgrade
#RUN flutter config --enable-web
#
##RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_arm64.deb
#
## Copy files to container and build
#RUN mkdir /app/
#COPY . /app/
#WORKDIR /app/
#RUN flutter build web
##
## Record the exposed port
#EXPOSE 5000
#
## make server startup script executable and start the web server
#RUN ["chmod", "+x", "/app/server/server.sh"]
#
#ENTRYPOINT [ "/app/server/server.sh"]