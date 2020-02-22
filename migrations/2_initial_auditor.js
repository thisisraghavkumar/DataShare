var Migrations = artifacts.require("./Auditor.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
