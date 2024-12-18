# Use a imagem base do Flutter com Dart SDK atualizado
FROM dart:stable

# Instale o Flutter
RUN apt-get update && apt-get install -y \
    git \
    && git clone https://github.com/flutter/flutter.git /flutter \
    && /flutter/bin/flutter doctor

# Adicione o Flutter ao PATH
ENV PATH="/flutter/bin:${PATH}"

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