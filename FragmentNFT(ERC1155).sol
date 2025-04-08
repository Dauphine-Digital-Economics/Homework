// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ISCNFT {
    function createComponent(
        address to,
        string memory name,
        string memory componentType,
        string memory manufacturer,
        string memory tokenURI
    ) external returns (uint256);
}

contract FragmentNFT is ERC1155URIStorage, Ownable, ReentrancyGuard {
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
    
    // Counter for Fragment NFT IDs
    uint256 private _tokenIdCounter;
    
    // Total collected tax
    uint256 public totalTaxCollected;
    
    // SCT token address
    address public sctToken;
    
    // SCNFT contract address
    address public scnftContract;
    
    // Blind box price in SCT tokens
    uint256 public blindBoxPrice = 10 * 10**18; // 10 SCT tokens
    
    // Fragment types (1-5 for Engine parts, 6-10 for Fuselage parts, etc.)
    uint256 public constant FRAGMENT_TYPES = 5;
    uint256 public constant COMPONENT_TYPES = 3; // Engine, Fuselage, Wing
    
    // Mapping from component type to required fragment IDs
    mapping(uint256 => uint256[]) public requiredFragments;
    
    // Fragment metadata
    struct FragmentMetadata {
        string name;
        uint256 componentType; // 0 = Engine, 1 = Fuselage, 2 = Wing
        uint256 fragmentIndex; // Index within component (0-4)
    }
    
    // Mapping from token ID to metadata
    mapping(uint256 => FragmentMetadata) public fragmentMetadata;
    
    // Mapping from component type to component name
    mapping(uint256 => string) public componentTypeNames;
    
    // Events
    event BlindBoxPurchased(address indexed buyer, uint256[] fragmentIds, uint256[] amounts);
    event FragmentsCombined(address indexed user, uint256[] fragmentIds, uint256 componentId);
    event TaxCollected(address indexed from, uint256 totalTax);
    
    constructor(
        address initialOwner,
        address _aerospaceFund,
        address _givingBlock,
        address _gitcoin,
        address _sctToken
    ) ERC1155("") Ownable(initialOwner) {
        require(_aerospaceFund != address(0), "Invalid aerospace fund address");
        require(_givingBlock != address(0), "Invalid giving block address");
        require(_gitcoin != address(0), "Invalid gitcoin address");
        require(_sctToken != address(0), "Invalid SCT token address");
        
        aerospaceFund = _aerospaceFund;
        givingBlock = _givingBlock;
        gitcoin = _gitcoin;
        sctToken = _sctToken;
        
        // Set up component type names
        componentTypeNames[0] = "Engine";
        componentTypeNames[1] = "Fuselage";
        componentTypeNames[2] = "Wing";
        
        // Initialize required fragments for each component type
        _setupRequiredFragments();
    }
    
    // Set up the fragments required for each component type
    function _setupRequiredFragments() private {
        for (uint256 i = 0; i < COMPONENT_TYPES; i++) {
            for (uint256 j = 0; j < FRAGMENT_TYPES; j++) {
                uint256 fragmentId = i * FRAGMENT_TYPES + j;
                requiredFragments[i].push(fragmentId);
                
                // Set up fragment metadata
                fragmentMetadata[fragmentId] = FragmentMetadata({
                    name: string(abi.encodePacked(componentTypeNames[i], " Fragment ", _toString(j + 1))),
                    componentType: i,
                    fragmentIndex: j
                });
                
                // Set URI for each fragment type
                _setURI(fragmentId, string(abi.encodePacked("https://example.com/metadata/fragment/", _toString(fragmentId))));
            }
        }
    }
    
    // Helper function to convert uint to string
    function _toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        
        uint256 temp = value;
        uint256 digits;
        
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        
        bytes memory buffer = new bytes(digits);
        
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        
        return string(buffer);
    }
    
    // Set SCNFT contract address
    function setScnftContract(address _scnftContract) external onlyOwner {
        require(_scnftContract != address(0), "Invalid SCNFT contract address");
        scnftContract = _scnftContract;
    }
    
    // Update blind box price
    function updateBlindBoxPrice(uint256 _price) external onlyOwner {
        blindBoxPrice = _price;
    }
    
    // Purchase a blind box to get random fragments
    function purchaseBlindBox(uint256 quantity) external nonReentrant {
        require(quantity > 0, "Quantity must be greater than zero");
        
        // Calculate total price
        uint256 totalPrice = blindBoxPrice * quantity;
        
        // Transfer SCT tokens from buyer to this contract
        IERC20(sctToken).transferFrom(msg.sender, address(this), totalPrice);
        
        // Distribute tax
        uint256 taxAmount = (totalPrice * POVR_TAX_RATE) / POVR_TAX_DENOMINATOR;
        uint256 aerospaceFundAmount = (taxAmount * AEROSPACE_FUND_PERCENTAGE) / 100;
        uint256 givingBlockAmount = (taxAmount * GIVING_BLOCK_PERCENTAGE) / 100;
        uint256 gitcoinAmount = taxAmount - aerospaceFundAmount - givingBlockAmount;
        
        // Transfer tax to recipients
        IERC20(sctToken).transfer(aerospaceFund, aerospaceFundAmount);
        IERC20(sctToken).transfer(givingBlock, givingBlockAmount);
        IERC20(sctToken).transfer(gitcoin, gitcoinAmount);
        
        // Update total tax collected
        totalTaxCollected += taxAmount;
        
        // Generate random fragments
        uint256[] memory fragmentIds = new uint256[](quantity);
        uint256[] memory amounts = new uint256[](quantity);
        
        for (uint256 i = 0; i < quantity; i++) {
            // Generate a random fragment ID (0 to COMPONENT_TYPES * FRAGMENT_TYPES - 1)
            // In a real implementation, you'd use a more secure random number generator
            uint256 randomFragmentId = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, i))) % (COMPONENT_TYPES * FRAGMENT_TYPES);
            fragmentIds[i] = randomFragmentId;
            amounts[i] = 1;
        }
        
        // Mint fragments to buyer
        _mintBatch(msg.sender, fragmentIds, amounts, "");
        
        emit BlindBoxPurchased(msg.sender, fragmentIds, amounts);
        emit TaxCollected(msg.sender, taxAmount);
    }
    
    // Combine fragments to create a complete component (ERC721 NFT)
    function combineFragments(uint256 componentType) external nonReentrant {
        require(componentType < COMPONENT_TYPES, "Invalid component type");
        require(scnftContract != address(0), "SCNFT contract not set");
        
        // Get required fragments for this component type
        uint256[] memory requiredFragmentIds = requiredFragments[componentType];
        
        // Check if user has all required fragments
        for (uint256 i = 0; i < requiredFragmentIds.length; i++) {
            require(balanceOf(msg.sender, requiredFragmentIds[i]) >= 1, "Missing required fragment");
        }
        
        // Burn fragments from user
        for (uint256 i = 0; i < requiredFragmentIds.length; i++) {
            _burn(msg.sender, requiredFragmentIds[i], 1);
        }
        
        // Create component NFT
        uint256 componentId = ISCNFT(scnftContract).createComponent(
            msg.sender,
            componentTypeNames[componentType],
            componentTypeNames[componentType],
            "Aerospace Manufacturing Co.",
            string(abi.encodePacked("https://example.com/metadata/component/", _toString(componentType)))
        );
        
        emit FragmentsCombined(msg.sender, requiredFragmentIds, componentId);
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
    
    // Create fragment types (admin function for initialization)
    function createFragmentType(
        uint256 id,
        string memory name,
        uint256 componentType,
        uint256 fragmentIndex,
        string memory uri
    ) external onlyOwner {
        require(id < COMPONENT_TYPES * FRAGMENT_TYPES, "Invalid fragment ID");
        
        fragmentMetadata[id] = FragmentMetadata({
            name: name,
            componentType: componentType,
            fragmentIndex: fragmentIndex
        });
        
        _setURI(id, uri);
    }
    
    // Special mint function for testing purposes
    function mint(address to, uint256 id, uint256 amount) external onlyOwner {
        _mint(to, id, amount, "");
    }
    
    // Batch mint for testing purposes
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts) external onlyOwner {
        _mintBatch(to, ids, amounts, "");
    }
    
    // Withdraw SCT tokens (admin function)
    function withdrawSct() external onlyOwner {
        uint256 balance = IERC20(sctToken).balanceOf(address(this));
        IERC20(sctToken).transfer(owner(), balance);
    }
}
