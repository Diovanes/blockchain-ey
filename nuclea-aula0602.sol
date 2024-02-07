
/*
SPDX-License-Identifier: CC-BY-4.0
(c) Desenvolvido por Adriano Costa
This work is licensed under a Creative Commons Attribution 4.0 International License.
*/

/*
Contratct - 0xb2429d418041c0bc0324819a57e594ca4ed8c175
*/
pragma solidity 0.8.19;

/// @author Diovane Schumann
/// @title Donate Control
contract DonateControl{
    mapping(address => uint256) public donations;
    uint256 totalValue;

    // Notifica sempre que ocorrer uma nova doação
    event newDonate(address indexed donor, uint256 value);
    event newTotalValue(uint256 totalValue);

    constructor(uint256 _startValeu) {
        totalValue = _startValeu;
    }

    // @notice Notifica o novo doador com o valor doado
    // @notice Notifica alteracao no total arrecadado
    // @dev Historico de transacoes
    function newDonation(uint256 value) public  {
        require(donations[msg.sender] == 0, "Valor invalido!");

        donations[msg.sender] = value;
        totalValue = totalValue + value;
        
        emit newDonate(msg.sender, value);
        emit newTotalValue(totalValue);
    }

    // @return O valor arrecadado
    function getTotalValue() view public returns (uint256) {
        return totalValue;
    }

}