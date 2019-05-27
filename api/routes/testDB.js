const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");

// Variable to be sent to Frontend with Database status
let databaseConnection = "Waiting for Database response...";

router.get("/", function(req, res, next) {
    res.send(databaseConnection);
});
//https://github.com/docker/hub-feedback/issues/1255
/// It looks like mongo is a little slow to start so looping a connection request instead of only trying once works.
// Remember hospitalrun, how some scripts had a timeout for a few seconds? This kinda thing might be why.
/*
// Connecting to MongoDB
mongoose.connect(
    "mongodb://mongodb:27017/test", { useNewUrlParser: true }
);

// If there is a connection error send an error message
mongoose.connection.on("error", error => {
    console.log("Database connection error:", error);
    databaseConnection = "Error connecting to Database:"+error;
});

// If connected to MongoDB send a success message
mongoose.connection.once("open", () => {
    console.log("Connected to Database!");
    databaseConnection = "Connected to Database";
});
*/
const options = {
    autoIndex: false, // Don't build indexes
    reconnectTries: 30, // Retry up to 30 times
    reconnectInterval: 500, // Reconnect every 500ms
    poolSize: 10, // Maintain up to 10 socket connections
    // If not connected, return errors immediately rather than waiting for reconnect
    bufferMaxEntries: 0,
    useNewUrlParser: true
  }

const connectWithRetry = () => {
  console.log('MongoDB connection with retry')
  mongoose.connect("mongodb://mongodb:27017/test", options).then(()=>{
    console.log('MongoDB is connected'); databaseConnection = "Database is connected";
  }).catch(err=>{
    console.log('MongoDB connection unsuccessful, retry after 5 seconds.');
    databaseConnection = "Database connection unsuccessful, retrying...";
    setTimeout(connectWithRetry, 5000)
  })
}

connectWithRetry()
module.exports = router;
