
pragma solidity ^0.8.0;


contract OwnerFinancing {

    struct Property {

        address owner;

        uint price;
        
        bool ownerFinance;

        uint downPayment;
        uint interest;

    }


    struct Loan {

        address Owner;

        uint propertyID;
    
        uint totalPayment;
        uint initalPayment;

        uint first;
        uint second;
        uint third;
        uint fouth;

        uint interest;

    }




    mapping(address => mapping(address => mapping (uint => Property))) private Properties;
    mapping(address => mapping(address => mapping (uint => Loan))) private Loans;


    function listProperty(uint price, bool financing, uint downPayment, uint interest) public returns (uint) {

        Properties[msg.sender][ID].owner = msg.sender;
        Properties[msg.sender][ID].price = price;
        Properties[msg.sender][ID].ownerFinance = true;
        //Properties[msg.sender][ID.]



    }



}