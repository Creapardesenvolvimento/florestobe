FROM cirrusci/flutter:stable
# Ou, se necessário, você pode usar uma versão mais recente do Flutter:
# FROM cirrusci/flutter:latest

WORKDIR /app

COPY . .

RUN flutter upgrade   # Certifique-se de ter a versão mais recente do Flutter
RUN flutter pub get

RUN flutter build web

EXPOSE 8080

CMD ["flutter", "run", "--web-port=8080", "--web-hostname=0.0.0.0"]
