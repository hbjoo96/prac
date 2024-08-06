

function App2(){
    // prompt : 이름입력
    // 현재 날짜 
    // 3~5월 : 봄 , 6~8 : 여름 , 9~11월 : 가을, 12~2월 : 겨울
    // <prompt>이름을 말해주세요.</prompt>
    let name2 = prompt("이름입력");
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth()+1;
    let day = date.getDate();
    let season 
    if (month >= 3 && month <= 5){
        season = "봄"
    }else if(month >= 6 && month <= 8){
        season = "여름"
    }else if(month >= 9 && month <= 11){
        season = "가을"
    }else{
        season = "겨울"
    }
    
    let myStyle = {
        color :'red'
    }
    return(
        <div>
            <h1>{year}.{month}.{day}날짜</h1>
            <hr></hr>
            <p>{name2}님 지금은 {season}입니다. 
                좋은 하루 보내세요 !
            </p>

            {/* JSX문법에서 자주 사용되어지는 방법
            1. style 적용
            inline(태그안에) 적용시 객체 형식으로 적용해야한다!

            2. 삼항연산자
                조건을 통해서 다른 내용을 사용자에게 보여줄 때 사용됨! 

             */}
            <h1 style={myStyle}>오늘은 월요일</h1>

            {/* "선생님을 제외한 다른 사람은 야근"을 출력시키고 싶다. */}
            { name2 == '선생님'? <h1>칼퇴</h1> :  <h1>야근</h1>}
            
        </div>
    )
}

export default App2;