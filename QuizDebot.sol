pragma ton-solidity ^0.36.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "./Debot.sol";
import "./Terminal.sol";

contract QuizDebot is Debot {


    // helper modifier
    modifier accept() {
        tvm.accept();
        _;
    }
        // Debot context ids


   uint public result;
    /*
     *   Init functions
    */

    constructor(uint8 options, string debotAbi, string targetAbi, address targetAddr) public {
        require(tvm.pubkey() == msg.pubkey(), 100);
        tvm.accept();
        init(options, debotAbi, targetAbi, targetAddr);
    }  

    /*
     *  Overrided Debot functions
     */
   

    function fetch() public override accept returns (Context[] contexts) {}
       

    function getVersion() public override accept returns (string name, uint24 semver) {
        name = "hello world debot";
        semver = (1 << 8) | 3;
    }

    
    function quit() public override accept { }    

 function start() override public {
       Terminal.print(0, "Hello from debot");
     }
   
}