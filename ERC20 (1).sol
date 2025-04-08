// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

contract SCToken is ERC20, Ownable {
    // PoVR tax rate (0.5%)
    uint256 public constant POVR_TAX_RATE = 5; // 0.5% = 5/1000
    uint256 public constant POVR_TAX_DENOMINATOR = 1000;
    
    // Tax distribution percentages
    uint256 public constant AEROSPACE_FUND_PERCENTAGE = 50;
    uint256 public constant GIVING_BLOCK_PERCENTAGE = 30;
    uint256 public constant GITCOIN_PERCENTAGE = 20;
    
    // Tax recipient addresses
    address public aerospaceFund;
    address public givingBlock;
    address public gitcoin;
    
    // Total collected tax
    uint256 public totalTaxCollected;
    
    // Exempt addresses from taxation (like the contracts themselves)
    mapping(address => bool) public isExempt;
    
    constructor(
        address initialOwner,
        address _aerospaceFund,
        address _givingBlock,
        address _gitcoin
    ) ERC20("Supply Chain Token", "SCT") Ownable(initialOwner) {
        require(_aerospaceFund != address(0), "Invalid aerospace fund address");
        require(_givingBlock != address(0), "Invalid giving block address");
        require(_gitcoin != address(0), "Invalid gitcoin address");
        
        aerospaceFund = _aerospaceFund;
        givingBlock = _givingBlock;
        gitcoin = _gitcoin;
        
        // Mint initial supply to the owner
        _mint(initialOwner, 1000000 * 10**decimals());
    }
    
    // Set an address as exempt or not exempt from taxation
    function setExemptStatus(address account, bool status) external onlyOwner {
        isExempt[account] = status;
    }
    
    // Update tax recipients
    function updateTaxRecipients(
        address _aerospaceFund,
        address _givingBlock,
        address _gitcoin
    ) external onlyOwner {
        require(_aerospaceFund != address(0), "Invalid aerospace fund address");
        require(_givingBlock != address(0), "Invalid giving block address");
        require(_gitcoin != address(0), "Invalid gitcoin address");
        
        aerospaceFund = _aerospaceFund;
        givingBlock = _givingBlock;
        gitcoin = _gitcoin;
    }
    
    // Override transfer function to include PoVR tax
    function _update(address from, address to, uint256 value) internal override {
        // Skip tax if either address is exempt or if it's a mint/burn
        if (from == address(0) || to == address(0) || isExempt[from] || isExempt[to]) {
            super._update(from, to, value);
            return;
        }
        
        // Calculate tax amount (0.5% of transfer amount)
        uint256 taxAmount = (value * POVR_TAX_RATE) / POVR_TAX_DENOMINATOR;
        
        // Calculate distribution amounts
        uint256 aerospaceFundAmount = (taxAmount * AEROSPACE_FUND_PERCENTAGE) / 100;
        uint256 givingBlockAmount = (taxAmount * GIVING_BLOCK_PERCENTAGE) / 100;
        uint256 gitcoinAmount = taxAmount - aerospaceFundAmount - givingBlockAmount; // To avoid rounding errors
        
        // Update total tax collected
        totalTaxCollected += taxAmount;
        
        // Transfer to recipient minus tax
        super._update(from, to, value - taxAmount);
        
        // Distribute tax to the three recipients
        super._update(from, aerospaceFund, aerospaceFundAmount);
        super._update(from, givingBlock, givingBlockAmount);
        super._update(from, gitcoin, gitcoinAmount);
        
        emit TaxCollected(from, taxAmount, aerospaceFundAmount, givingBlockAmount, gitcoinAmount);
    }
    
    // Mint function to create more tokens (only owner)
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
    
    // Event emitted when tax is collected
    event TaxCollected(
        address indexed from,
        uint256 totalTax,
        uint256 aerospaceFundAmount,
        uint256 givingBlockAmount,
        uint256 gitcoinAmount
    );
}
