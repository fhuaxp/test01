pragma solidity ^0.4.24;

// 接口，所有的函数必须是抽象函数
interface Wifi {
    function wifi() public constant returns(string);
}

interface BlueTooth {
    function blue() public constant returns(string);
}

contract Phone {
    
    // 所有手机都有开关机功能
    function start() internal constant returns(string) {
        return "phone open!";
    }
    
    function close() internal constant returns(string) {
        return "phone close!";
    }
    
    // 定义抽象闹钟函数，交给子类实现
    // 没有 abstract 关键字
    function alarm() public constant returns(string);
    
}

contract miPhone is Phone, Wifi, BlueTooth {
    function alarm() public constant returns(string) {
        return "mi alarm.";
    }
    
    function wifi() public constant returns (string) {
        return "mi wifi.";
    }
    
    function blue() public constant returns (string) {
        return "mi blue.";
    }
}
