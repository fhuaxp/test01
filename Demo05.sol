pragma solidity ^0.4.24;
// 用来实现产品众筹的智能合约
contract CrowdFunding{
    // 定义结构体（自定义类型，没有函数）
    struct Funder{ // 定义投资人
        address addr;   // 投资人地址
        uint amount;    // 投资金额
    }
    
    struct Product{ // 众筹产品
        address addr;   // 众筹账户
        uint goal;      // 预定众筹总金额
        uint amount;    // 已众筹金额
        uint funderNum; // 投资人数量
        // 映射类型
        mapping(uint => Funder) funders;    // 投资人信息的映射表mapping
    }
    
    // 智能合约需要记录众筹产品的数量和详细信息
    uint count;  // 缺省为0
    // 记录众筹产品的相关信息
    mapping (uint => Product) public products;
    
    // 初始化众筹产品
    function initProduct(address addr, uint goal) returns (uint productID){
        // 结构体不用new
        products[count++] = Product(addr, goal, 0, 0);
    }
    
    // 某个投资者给产品投资（传入的参数就是mapping中的key）
    function vote(uint productID) payable {
        Product p = products[productID];
        
        // 把当前投资人的信息存到mapping中，第二种创建结构体的方式，jason格式
        p.funders[p.funderNum++] = Funder({addr: msg.sender, amount: msg.value});
        //p.amount += msg.value;
    }
    
    // 判断当前产品是否众筹成功
    function check(uint productID) payable returns (bool){
        Product p= products[productID];
        
        if(p.amount < p.goal*10**18){
            return false;
        }
        
        // 如果众筹成功，转账给产品地址
        p.addr.transfer(p.amount);
        p.amount = 0;
        return true;
    }
}
