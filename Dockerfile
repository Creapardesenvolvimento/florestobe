# Use a imagem oficial mais recente do Flutter
FROM flutter/flutter:stable

WORKDIR /app

COPY . .

# Certifique-se de que o Flutter está na versão mais recente e compatível
RUN flutter upgrade

# Instale as dependências do projeto
RUN flutter pub get

# Compile o aplicativo para Web
RUN flutter build web

EXPOSE 8080

# Inicie o aplicativo
CMD ["flutter", "run", "--web-port=8080", "--web-hostname=0.0.0.0"]
