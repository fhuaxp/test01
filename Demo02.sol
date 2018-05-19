pragma solidity ^0.4.24;
// 演示属性与方法的访问修饰符操作
contract Demo02 {
    
    // 定义三个属性
    string public name;
    uint internal age; // 属性缺省值internal,而函数是public
    int private num; // int ==> int256 且可以存储负数
    
    // 构造方法，名称必须与合约名称相同
    function Demo02(string _name, uint _age, int _num) {
        name = _name;
        age =_age;
        num = _num;
    }
    
    // 函数支持多态，构造函数不支持多态
    
    // 定义三个函数来显示相应的属性
    // 添加constant关键字代表当前函数不会往区块写数据
    function showName() public constant returns(string) {
        return name;
    }
    
    function showAge() internal returns(uint) {
        return age;
    }
    
    function showNum() private returns(int) {
        return num;
    }
        
}

// is代表继承，由于构造函数不支持多态，因此在继承的时候需要指定参数
contract Son is Demo02("solidity",18,-10) {
    
    string sonName;
    
    function show() public constant returns(string,string,uint) {
        return(sonName,name,age);
    }
}
