// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ComponentNFT is ERC721, ERC721URIStorage, AccessControl {
    using Counters for Counters.Counter;

    bytes32 public constant MANUFACTURER_ROLE = keccak256("MANUFACTURER_ROLE");
    bytes32 public constant TESTER_ROLE = keccak256("TESTER_ROLE");
    
    Counters.Counter private _tokenIdCounter;
    
    struct ComponentData {
        string componentType;
        string manufacturer;
        uint256 manufactureDate;
        string[] testResults;
        address[] supplyChainActors;
        uint256[] timestamps;
    }
    
    mapping(uint256 => ComponentData) public components;
    
    event ComponentCreated(uint256 indexed tokenId, string componentType, string manufacturer);
    event TestResultAdded(uint256 indexed tokenId, string testResult);
    event SupplyChainUpdate(uint256 indexed tokenId, address actor, uint256 timestamp);
    
    constructor() ERC721("Space Component NFT", "SCNFT") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
    
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
    
    function createComponent(
        address to,
        string memory componentType,
        string memory manufacturer,
        string memory uri
    ) public onlyRole(MANUFACTURER_ROLE) returns (uint256) {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        
        components[tokenId] = ComponentData({
            componentType: componentType,
            manufacturer: manufacturer,
            manufactureDate: block.timestamp,
            testResults: new string[](0),
            supplyChainActors: new address[](0),
            timestamps: new uint256[](0)
        });
        
        emit ComponentCreated(tokenId, componentType, manufacturer);
        return tokenId;
    }
    
    function addTestResult(uint256 tokenId, string memory testResult) 
        public 
        onlyRole(TESTER_ROLE) 
    {
        require(ownerOf(tokenId) != address(0), "Component does not exist");
        components[tokenId].testResults.push(testResult);
        emit TestResultAdded(tokenId, testResult);
    }
    
    function updateSupplyChain(uint256 tokenId) public {
        require(ownerOf(tokenId) != address(0), "Component does not exist");
        components[tokenId].supplyChainActors.push(msg.sender);
        components[tokenId].timestamps.push(block.timestamp);
        emit SupplyChainUpdate(tokenId, msg.sender, block.timestamp);
    }
    
    function getComponentData(uint256 tokenId) public view returns (
        string memory componentType,
        string memory manufacturer,
        uint256 manufactureDate,
        string[] memory testResults,
        address[] memory supplyChainActors,
        uint256[] memory timestamps
    ) {
        require(ownerOf(tokenId) != address(0), "Component does not exist");
        ComponentData storage component = components[tokenId];
        return (
            component.componentType,
            component.manufacturer,
            component.manufactureDate,
            component.testResults,
            component.supplyChainActors,
            component.timestamps
        );
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }
}

// Le contrat QualityToken reste inchangé car il n'avait pas d'erreur
contract QualityToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant SPACE_AGENCY_ROLE = keccak256("SPACE_AGENCY_ROLE");
    
    mapping(address => uint256) public testingReputationScore;
    
    event TestingRewardIssued(address indexed tester, uint256 amount);
    event ReputationScoreUpdated(address indexed tester, uint256 newScore);
    
    constructor() ERC20("Quality Assurance Token", "QAT") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }
    
    function issueTestingReward(address tester, uint256 amount) 
        public 
        onlyRole(SPACE_AGENCY_ROLE) 
    {
        _mint(tester, amount);
        testingReputationScore[tester] += 1;
        
        emit TestingRewardIssued(tester, amount);
        emit ReputationScoreUpdated(tester, testingReputationScore[tester]);
    }
    
    function getReputationScore(address tester) public view returns (uint256) {
        return testingReputationScore[tester];
    }
    
    function updateReputationScore(address tester, uint256 score) 
        public 
        onlyRole(SPACE_AGENCY_ROLE) 
    {
        testingReputationScore[tester] = score;
        emit ReputationScoreUpdated(tester, score);
    }
}