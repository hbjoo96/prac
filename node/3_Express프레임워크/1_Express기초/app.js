// express의 핵심 파일, 몸통, 컨트롤타워, 대장님
// 서버생성, 연결을 시켜주기, 미들웨어 등록

// 1. express버전으로 서버 생성
const express = require("express") ;
const app = express() ;

// app에게 알려주기! -> 미들웨어 등록
// 앞으로 정적인 파일은 public폴더만 보세요!
app.use(express.static("public")) ;

// 2. 사용자가 접속했을 때 서버를 생성하겠다!
//  "/" -> 사용자가 메인페이지로 들어왔을 때!
app.get("/", (req, res)=>{
    console.log("서버가 생성되었습니다!!") ;
    // 사용자에게 <h1>환영합니다</h1>
    // res.send("<h1>환영합니다</h1>") ;
    
    // 사용자에게 파일로 데이터를 보여주기! -> fs모듈과 같은 기능
    // 중요★ express에서 경로는 절대경로를 사용한다(규칙)
    // 현재 작업중인 파일의 절대경로를 알아오는 키워드 -> __dirname
    console.log(__dirname)
    res.sendFile(__dirname + "/index2.html") ;

    // 중요 ★ express에서 정적인파일(css, js, img ..)은 반드시 public에서 관리
    // 명령어로 제약 -> app(대장님)에게 반드시 사용자가 정적인 파일 요청하면, public으로 조회하세요!

}) ;

// 3. 마지막에 항상 포트번호 등록하기!
app.listen(3000)