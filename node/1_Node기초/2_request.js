// 접속한 사용자의 ip를 체크
const http = require("http") ;
const userip = require('request-ip') ;

http.createServer((req, res)=>{
    // req역할 파악 -> 클라이이언트가 넘겨준 정보를 담고 있는 시간 (접속시간, 접속장소, ip, 데이터)
    // 사용자의 접속 ip 확인
    let ip = userip.getClientIp(req) ; 
    // ip앞에 붙어있는 불필요한 7글자를 삭제
    let req_ip = ip.substring(7) ;
    if(req_ip == '192.168.20.71'){
        console.log("짝궁님 환영합니다!")
    }else{
        console.log("다른 사람은 나가세요!")
    }
    // 실습 -> 조건문 활용
    // 1. 내 짝궁의 컴퓨터가 접속하면 console.log("짝궁님 환영합니다!");
    // 2. 그 외 다른사람이 접속하면 "다른사람은 나가세요!"
    // ip를  조회할 때는 ip모듈과 req를 활용한다!
    
}).listen(3000) ;

    