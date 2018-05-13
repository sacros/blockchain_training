module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  deploy: [
    "Token"
  ],
  networks: {
    development: {
      host: "localhost",
      port: "7545",
      network_id: "*"
    }
  }
};

