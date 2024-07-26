let num1 = 10 ;
let num2 = 5 ;

// 모듈을 제작한 다음에 반드시 "수출"을 해줘야 다른 파일에서 사용이 가능
// 중요한 코드!
// 수출할 때 반드시 exports s붙여주기!

module.exports = {num1, num2} ;