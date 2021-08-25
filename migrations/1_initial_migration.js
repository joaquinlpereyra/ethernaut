const Migrations = artifacts.require("Migrations");
const CoinFlipAttack = artifacts.require("CoinFlipAttack");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(CoinFlipAttack);
};
