# Use an official Node.js runtime as a parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app/

# Copy the rest of the application code to the working directory
COPY . .

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli@15.0.0

# Install app dependencies
RUN npm install

#install sonar dependency
RUN npm install --save-dev sonar-scanner

# Expose the port your app runs on
EXPOSE 4200

# Start the application
CMD ["ng", "serve", "--host", "0.0.0.0"] 


