pragma solidity ^0.4.24;

// 编写一个转账合约，并且和悦所有者可以销毁合约
contract Demo04 {
    
    address _owner; // 合约的所有者
    uint money; // 存储合约自身的钱
    
    // 构造方法只有合约创建者调用
    function Demo04() payable {
        // msg:是内置对象
        _owner = msg.sender;
        money = msg.value;
    }
    
    // 添加一个日志
    event logMsg(address);
    event logMsg2(string);
    
    // 编写一个转账的函数（向owner转账）,转账时必须要添加payable关键字
    function transcoin() payable {
        // msg.value 调用当前函数时输入的金额
        _owner.transfer(msg.value);
        logMsg(msg.sender);
    }
    
    // 编写一个函数，用来查询制定账户的余额信息
    function balance() returns(address, uint256) {
        logMsg2("test");
        address addr = msg.sender; // 获取调用者的地址
        return (addr, addr.balance);
        
    }
     
    // 定义修改器
    modifier onlyOwner {
        if (msg.sender != _owner) {
            //调用者不是创建者，抛出异常
            throw;
        }
        _;  // 表示继续往下走
    }
    
    // 自毁：通常是合约的创建者
    // 加入修改器onlyOwner
    function kill(address addr) onlyOwner {

        // 销毁当前合约对象，并且把合约的金额发送给指定地址
        selfdestruct(addr);
    }
}
