# Use an official Node.js runtime as the base image with Node.js version 16
FROM node:16

# Set the working directory to /app in the container
WORKDIR /app

# Copy the package.json file into the container
COPY package.json .

# Install project dependencies using npm
RUN npm i

# Copy the rest of the project files into the container
COPY . .

# Expose the port that you have mentioned in your vite.config.js file (for example, 5173)
# Replace [Port you mentioned in the vite.config file] with the actual port number
EXPOSE 5173

# Start the development server using npm run dev
CMD ["npm", "run", "dev"]
