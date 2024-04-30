FROM node:latest as frontend

# Set the working directory for the frontend
WORKDIR /app/frontend

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the frontend code
COPY . .

EXPOSE 3000
#  
CMD ["npm", "start", "--host", "0.0.0.0"]
