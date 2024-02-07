// SPDX-License-Identifier: GPL-3.0

// 0x2e7e14944ae10753c0dd4a17e21a9129a2198b07
pragma solidity 0.8.19;

import "./owner.sol";
import "./titulo.sol";

/**
 * @title NotaComercial
 * @dev Operacoes de uma nota comercial
 * @author Diovane Schumann
 */
 contract CCB is Titulo, Owner {

    string _credor;
    uint256 immutable _dataEmissao;
    uint256 _valor;
    uint8 immutable _decimais;
    uint256 _prazoPagamento;
    uint8 immutable _numParcelas;

    constructor(string memory credor_) {
        _credor = credor_;
        _dataEmissao = block.timestamp;
        _valor = 300000000;
        _decimais = 2;
        _prazoPagamento = _dataEmissao + 28 days;
        _numParcelas = 6;
        emit NovoPrazoPagamento(_dataEmissao, _prazoPagamento);
    }

    /**
     * @dev Retorna o valor nominal.
     */
    function valorNominal() external view returns (uint256) {
        return _valor;
    }

    /**
     * @dev Retorna o nome do Emissor.
     */
    function nomeEmissor() external view returns (string memory) {
        return _credor;
    }

    /**
     * @dev Retorna a data da emissao.
     */
    function dataEmissao() external view returns (uint256) {
        return _dataEmissao;
    }

    /**
    * @dev muda o prazo de pagamento
    * @notice dependendo da situacao economica o prazo de pagamento pode mudar
    * @param prazoPagamento_ novo prazo de pagamentos a ser adicionado. Em segundos
    */
    function mudaDataPagamento(uint256 prazoPagamento_) external onlyOwner returns (uint256) {
        emit NovoPrazoPagamento(_prazoPagamento, _prazoPagamento + prazoPagamento_);
        _prazoPagamento = _prazoPagamento + prazoPagamento_;
        return _prazoPagamento;
    }

 }