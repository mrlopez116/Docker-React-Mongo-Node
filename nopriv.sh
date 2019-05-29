echo "[Debug] Clone the repo in the home directory"
cd ~
git clone "https://github.com/mrlopez116/Docker-React-Mongo-Node.git"

echo "[Debug] Move into the repo directory"
cd "Docker-React-Mongo-Node"

echo "[Debug] Run NPM install on the dependencies for the client"
cd client/
npm install
cd ../

echo "[Debug] Running NPM install on the dependencies for the API.."
cd api/
npm install
cd ../

echo "[Debug] Praying..."
docker-compose up
