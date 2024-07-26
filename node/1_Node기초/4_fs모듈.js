// file system모듈을 활용해서 직접 작성한 글이 아닌, 파일을 리턴해주자!
// 1. 보안을 신경쓰기 위해서
// 2. 코드의 유지보수, 확장성을 위해서
const http = require('http') ;
const fs = require('fs').promises ; // 비동기 처리를 위한 데이터로 받아오겠다!
http.createServer(async(req, res)=>{
    // 1. 우리가 만든 리턴.html 파일을 읽어와!
    let html = await fs.readFile("./리턴.html") ;
    res.writeHead(200,{"Content-Type" : "text/html; charset=utf-8"}) ;
    res.write(html) ;
    res.end() ;
}).listen(3000) ;
// 서버를 껐다 키는 것은 백엔드 코드를 수정했을때