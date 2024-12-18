# Use a imagem base do Flutter
FROM cirrusci/flutter:stable

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos do projeto
COPY . .

# Execute flutter pub get para resolver dependências
RUN flutter pub get

# Compile o aplicativo Flutter para a web
RUN flutter build web

# Exponha a porta para o servidor web
EXPOSE 8080

# Use um servidor simples para servir os arquivos estáticos gerados pelo flutter build web
CMD ["python3", "-m", "http.server", "8080", "--bind", "0.0.0.0"]
