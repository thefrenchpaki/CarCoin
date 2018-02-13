var CarCoin = artifacts.require("./CarCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(CarCoin);
};
