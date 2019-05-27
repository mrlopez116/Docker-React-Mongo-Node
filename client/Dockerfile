# Use a lighter version of Node as a parent image
FROM mhart/alpine-node:12.2.0

# Set the working directory to /client
WORKDIR /client

# copy package.json into the container at /client
COPY package*.json /client/

# install dependencies
RUN npm install --verbose

# Copy the current directory contents into the container at /client
COPY . /client/

# Make sure everything's here
RUN echo "[client] " && ls -la

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run the app when the container launches
CMD ["npm", "start"]
