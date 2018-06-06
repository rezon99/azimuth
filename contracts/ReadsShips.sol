//  contract that uses the Ships contract

pragma solidity 0.4.24;

import './Ships.sol';

//  ReadsShips: referring to and testing against the Ships contract
//
//    To avoid needless repetition, this contract provides common
//    checks and operations using the Ships contract.
//
contract ReadsShips
{
  //  ships: ships state data storage contract.
  //
  Ships public ships;

  //  constructor(): set the Ships contract's address
  //
  constructor(Ships _ships)
    public
  {
    ships = _ships;
  }

  //  shipOwner(): require that :msg.sender is the owner of _ship
  //
  //    Note: ships with non-zore owners are guaranteed to be active.
  //
  modifier shipOwner(uint32 _ship)
  {
    require(ships.isOwner(_ship, msg.sender));
    _;
  }
}
