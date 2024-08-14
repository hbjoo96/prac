import React from "react";
import { useState, useRef, useEffect } from "react";

// usestate에 의해서 랜더링될때 계속 초기화 돼서 전역변수로 사용해야함.
let com_Score = 0;
let user_Score = 0;

const MyFinal = () => {
  // 1. start 버튼을 클릭했을때
  //    컴퓨터 주사위, 사용자 주사위가 랜덤하게 다른 주사위로 바꿔주세요
  // 2. 주사위 눈의 크기를 비교해서
  //    ComScore 또는 UserScore 값을 1 증가시켜주세요!
  // 3. ComScore 또는 UserScore 값이 먼저 10에 도달하게 되는 순간
  //    결과를 출력해주세요 (Com WIN or User WIN)
  const DicePic = [
    "./images/dice1.png",
    "./images/dice2.png",
    "./images/dice3.png",
    "./images/dice4.png",
    "./images/dice5.png",
    "./images/dice6.png",
  ];

  const [comPic, setComPic] = useState(DicePic[0]);
  const [userPic, setUserPic] = useState(DicePic[0]);
  const [comScore, setcomScore] = useState(0);
  const [userScore, setUserScore] = useState(0);
  const [result, setResult] = useState("");
  const [num, setNum] = useState(0);

  // useRef 변수는 재렌더링에 영향을 받지 않는다!
  const comImgRef = useRef();
  const userImgRef = useRef();

  function start_Btn() {
    let com_Point = parseInt(Math.random() * 6);
    // console.log("컴:", com_Point);
    let user_Point = parseInt(Math.random() * 6);
    // console.log("유저:", user_Point);
    setComPic(DicePic[com_Point]);
    // comImgRef.current.src = 'DicePic[com_point]'
    // console.log("컴퓨터 그림", DicePic[com_Point]);
    setUserPic(DicePic[user_Point]);
    // comImgRef.current.src = 'DicePic[user_point]'

    if (com_Point < user_Point) {
      user_Score += 1;
      //   console.log(com_Score);
      setUserScore(userScore + 1);
    } else if (com_Point > user_Point) {
      com_Score += 1;
      //   console.log(user_Score);
      setcomScore(comScore + 1);
    } else if (com_Point == user_Point) {
    }

    setNum(num + 1);
  }
  useEffect(() => {
    if (com_Score == 10) {
      setResult("com WIN");
    } else if (user_Score == 10) {
      setResult("user WIN");
    } else if (com_Score == user_Score) {
    }
    console.log("useEffect");
  }, [comScore, userScore]);
  // --> dependency Array (의존배열), 안에 있는 값이 바뀔때만 useEffect를 실행시키겠다
  // [] -> 첫 랜더링에서만 실행 / componentDidMount 같은 역할
  // 없으면 무조건 실행시키겠다

  return (
    <div>
      <h1>DICE GAME</h1>
      <p>클릭 수 : {num}</p>
      <button onClick={start_Btn}>Start</button>

      <div className="dice">
        <img ref={comImgRef} src={comPic}></img>
        <h1>Com Score : {comScore}</h1>
      </div>
      <div className="dice">
        <img ref={userImgRef} src={userPic}></img>
        <h1>User Score : {userScore}</h1>
      </div>

      <h1>결과 : {result}</h1>
    </div>
  );
};

export default MyFinal;
