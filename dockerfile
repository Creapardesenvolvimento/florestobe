# Use a imagem base do Flutter
FROM cirrusci/flutter:latest

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos do projeto
COPY . .

# Execute flutter pub get
RUN flutter pub get

# Compile o aplicativo
RUN flutter build web

# Exponha a porta que o aplicativo usará
EXPOSE 8080

# Comando para iniciar o aplicativo
CMD ["flutter", "run", "--web-port=8080", "--web-hostname=0.0.0.0"]