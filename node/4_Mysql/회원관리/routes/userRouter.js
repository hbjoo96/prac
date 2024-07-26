// 회원정보를 DB에 연결해서 관리하는 라우터
const express = require("express") ;
const router = express.Router() ;
const conn = require("../config/db")

// 1. 회원가입 경로로 접근했을 때!
router.post("/join", (req, res)=>{
    // 1. 프론트에서 넘어온 데이터 확인하기!
    // ** 포스트로 넘긴 데이터는 req안에 body로 존재한다!
    console.log("넘어온 데이터 :", req.body) ;
    let {id, pw, nick} = req.body ;

    // 2. DB와 연결해서 데이터 처리
    // 1) 처리할 sql 문장
    // 2) 입력할 데이터가 필요한 경우 -> 값을 넣어주기!
    // 3) 처리할 콜백함수
    let sql = "insert into member values (?, ?, ?)" ;
    conn.query(sql, [id, pw, nick], (err, rows)=>{
        console.log("DB insert : ", rows) ;
        if(rows){
            // 가입에 성공했을때, 메인으로 이동!
            res.redirect("/")
        }else{
            // 가입에 실패했을때, 알림!
            res.send("<script>alert('회원가입 실패!')</script>")
        } ;
    }) ;

}) ;

// 2. 로그인하는 로직
router.post("/login", (req, res)=>{
    // 사용자가 보낸 id, pw로 DB를 검증하는 로직
    console.log("넘어온 데이터 :", req.body)
    let {id, pw} = req.body ;

    // 실습!
    // 1. sql 쿼리문 작성 -> select활용 조건(id =? and pw = ?)
    // 2. conn쿼리문 실행 (sql, [데이터], (err, rows))
    // 3. id와 pw가 일치하면 콘솔창에 로그인 성공! / 불가능 로그인 실패!
    // 4. **select문을 실행할 때 반드시 rows의 length로 조건을 부여할 것
    //    -> 조건이 성립하면 데이터가 들어있는 배열 리턴, 성립하지 않으면 데이터가 비어있는 배열 리턴
    //    -> 반드시 데이터의 길이가 0보다 크다 == 데이터가 담겨있다!
    let sql = "select * from member where id = ? and pw = ?" ; 
    conn.query(sql, [id, pw], (err, rows)=>{
        console.log("DB연결 결과 :", rows)
        if(rows.length>0){
            console.log("로그인 성공!")
            // 사용자의 닉네임 정보를 세션에 저장
            // 사용자의 데이터는 DB에서 조회했기 때문에, rows 변수에서 데이터 꺼내기!
            req.session.nick = rows[0].nick
            res.redirect("/")
            // res.send("<script>alert('로그인 성공!')</script>")
        }else{
            res.send("<script>alert('로그인 실패!')</script>")
            console.log("로그인 실패!")
            
        }
    })

}) ;

// 3. 회원정보 수정
router.post("/update", (req, res)=>{
    console.log(req.body) ;
    let {id, pw, nick} = req.body ;

    // 쿼리문 생성
    // update문을 활용해서 조건을 부여할 때는 affectedRows값을 활용할 것!
    // why ? 조건이 잘못되더라도, 응답은 넘어온다 -> affected : 0
    // then ? 조건을 부여할 때 affected > 0 -> 영향이 받은 행이 존재한다.
    let sql = "update member set nick = ? where id = ? and pw = ?" ;
    conn.query(sql, [nick, id, pw], (err, rows)=>{
        console.log("DB연결 결과 :", rows)
        if(rows.affectedRows>0){
            console.log("변경 성공!")
            res.redirect("/")
        }else{
            console.log("변경 없음!")
        }
    })
}) ;

router.post("/delete", (req, res)=>{
    console.log(req.body) ;
    let {id, pw} = req.body ;
    let sql = "delete from member where id = ? and pw = ?" ;
    conn.query(sql, [id, pw], (err, rows)=>{
        console.log(rows) ;
        if(rows.affectedRows>0){
            console.log("탈퇴 성공!")
            res.redirect("/")
        }else{
            console.log("탈퇴 실패!")
        }
    });

}) ;

// 로그아웃
router.get("/logout", (req, res)=>{
    req.session.destroy()
    res.redirect("/")

}) ;

module.exports = router ;