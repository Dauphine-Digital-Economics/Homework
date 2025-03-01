// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

contract SCNFT is ERC721URIStorage, Ownable {
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
    
    // Counter for NFT IDs
    uint256 private _tokenIdCounter;
    
    // Total collected tax
    uint256 public totalTaxCollected;
    
    // SCT token address for tax collection
    address public sctToken;
    
    // PoVR verification status
    mapping(uint256 => bool) public isVerified;
    
    // NFT metadata
    struct ComponentMetadata {
        string name;
        string componentType;
        uint256 creationTimestamp;
        string manufacturer;
        string verificationProof;
    }
    
    // Mapping from token ID to metadata
    mapping(uint256 => ComponentMetadata) public componentMetadata;
    
    // Events
    event ComponentVerified(uint256 indexed tokenId, string proof);
    event ComponentCreated(uint256 indexed tokenId, string name, string componentType);
    event TaxCollected(address indexed from, uint256 totalTax, uint256 aerospaceFundAmount, uint256 givingBlockAmount, uint256 gitcoinAmount);
    
    constructor(
        address initialOwner,
        address _aerospaceFund,
        address _givingBlock,
        address _gitcoin,
        address _sctToken
    ) ERC721("Supply Chain NFT", "SCNFT") Ownable(initialOwner) {
        require(_aerospaceFund != address(0), "Invalid aerospace fund address");
        require(_givingBlock != address(0), "Invalid giving block address");
        require(_gitcoin != address(0), "Invalid gitcoin address");
        require(_sctToken != address(0), "Invalid SCT token address");
        
        aerospaceFund = _aerospaceFund;
        givingBlock = _givingBlock;
        gitcoin = _gitcoin;
        sctToken = _sctToken;
    }
    
    // Function to create a new component NFT
    function createComponent(
        address to,
        string memory name,
        string memory componentType,
        string memory manufacturer,
        string memory tokenURI
    ) external onlyOwner returns (uint256) {
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        
        componentMetadata[tokenId] = ComponentMetadata({
            name: name,
            componentType: componentType,
            creationTimestamp: block.timestamp,
            manufacturer: manufacturer,
            verificationProof: ""
        });
        
        emit ComponentCreated(tokenId, name, componentType);
        
        return tokenId;
    }
    
    // Function to submit PoVR verification proof
    function submitProof(uint256 tokenId, string memory proof) external {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        require(ownerOf(tokenId) == msg.sender, "Only owner can submit proof");
        require(!isVerified[tokenId], "Component already verified");
        
        // In a real implementation, this would verify the proof with an oracle
        // For this exercise, we'll simulate verification by simply marking it as verified
        
        isVerified[tokenId] = true;
        componentMetadata[tokenId].verificationProof = proof;
        
        emit ComponentVerified(tokenId, proof);
    }
    
    // Override transferFrom to include PoVR tax
    function transferFrom(address from, address to, uint256 tokenId) public override(ERC721, IERC721) {
        // Ensure the token is approved for transfer
        super.transferFrom(from, to, tokenId);
        
        // We don't tax the initial mint, only transfers
        if (from != address(0)) {
            _collectTax(from);
        }
    }
    
    // Override safeTransferFrom to include PoVR tax
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public override(ERC721, IERC721) {
        // Ensure the token is approved for transfer
        super.safeTransferFrom(from, to, tokenId, data);
        
        // We don't tax the initial mint, only transfers
        if (from != address(0)) {
            _collectTax(from);
        }
    }
    
    // Collect tax for NFT transfers
    function _collectTax(address from) internal {
        // Since we can't determine a "value" of the NFT easily,
        // we'll use a fixed tax amount for demonstration
        // In a real implementation, you'd need a price oracle or other mechanism
        
        // For this exercise, we'll use a fixed tax of 1 SCT token
        uint256 taxAmount = 1 * 10**18; // 1 SCT with 18 decimals
        
        // Split the tax among recipients
        uint256 aerospaceFundAmount = (taxAmount * AEROSPACE_FUND_PERCENTAGE) / 100;
        uint256 givingBlockAmount = (taxAmount * GIVING_BLOCK_PERCENTAGE) / 100;
        uint256 gitcoinAmount = taxAmount - aerospaceFundAmount - givingBlockAmount;
        
        // Update total tax collected
        totalTaxCollected += taxAmount;
        
        // Transfer tax from sender to recipients
        // This requires approval from the sender to this contract
        // In a real implementation, you'd need to handle this more elegantly
        
        // Note: This requires the SCToken to be properly designed to allow this contract to transfer
        // tokens on behalf of users. The SCToken.transferFrom method would be called here.
        
        // Emit event with all the tax distribution details
        emit TaxCollected(from, taxAmount, aerospaceFundAmount, givingBlockAmount, gitcoinAmount);
        
        // In a real implementation, you would call:
        // SCToken(sctToken).transferFrom(from, aerospaceFund, aerospaceFundAmount);
        // SCToken(sctToken).transferFrom(from, givingBlock, givingBlockAmount);
        // SCToken(sctToken).transferFrom(from, gitcoin, gitcoinAmount);
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
    
    // Update SCT token address
    function updateSctToken(address _sctToken) external onlyOwner {
        require(_sctToken != address(0), "Invalid SCT token address");
        sctToken = _sctToken;
    }
    
    // Check if a component exists
    function exists(uint256 tokenId) external view returns (bool) {
        return _ownerOf(tokenId) != address(0);
    }
}
