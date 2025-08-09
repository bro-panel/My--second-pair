# Node.js LTS + Debian Bullseye
FROM node:18-bullseye

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy package files and install
COPY package*.json ./
RUN npm install --production

# Copy all project files
COPY . .

# Start command
CMD ["node", "index.js"]
