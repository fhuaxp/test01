// 声明版本号
pragma solidity ^0.4.24;
// 讲解函数、uint、int、var、多值返回与接收
contract Demo01 {
    
    //函数格式：
    //function 函数名(参数) 访问修饰符(public默认) 函数类型 returns()
    function testInt() private returns (uint, int) {
        uint8 num1= 255;
        int8 num2 = 127;
        
        return (num1, num2);
    }
    
    function show() returns (uint, int) {
        // 通过var来声明变量，变量类型取决于第一次赋值的数据类型
        var (x,y) = testInt();  //智能合约内部函数不能用this
        return (x,y);
    }
    
}
