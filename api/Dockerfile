# Use a lighter version of Node as a parent image
FROM mhart/alpine-node:12.2.0

# Set the working directory to /api
WORKDIR /api

# copy package.json into the container at /api
COPY package*.json /api/

# install dependencies
RUN npm install --verbose

# Copy the current directory contents into the container at /api
COPY . /api/

# Make sure everything's here
RUN echo "[api] " && ls -la

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the app when the container launches
CMD ["npm", "start"]
