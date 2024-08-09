import React from "react";
import { useState } from "react";

const MyState02 = () => {
  // 1. 버튼 클릭시 어떤 버튼을 클릭했는지 숫자를 출력해주세요!
  // 2. 버튼 클릭시 1~3랜덤 수 생성 -> 랜덤 숫자 부분 출력
  const [num, setNum] = useState(0);
  const [ranNum, setRanNum] = useState(0);
  const [InputNum, setInputNum] = useState(0);

  function one() {
    console.log(1);
    setNum(1);
    setRanNum(parseInt(Math.random() * 3) + 1);
  }
  function two() {
    console.log(2);
    setNum(2);
    setRanNum(parseInt(Math.random() * 3) + 1);
  }
  function three() {
    console.log(3);
    setNum(3);
    setRanNum(parseInt(Math.random() * 3) + 1);
  }
  // 1, 2, 3 버튼 기능
  function chNum(e) {
    // e(이벤트 객체) : 이벤트의 정보를 가지고 있다
    // (어떤 이벤트가 발생했는지, 누가 발생시켰는지)
    // e.target : 이벤트르 발생시킨 태그

    setInputNum(e.target.innerText);
    setRanNum(parseInt(Math.random() * 3) + 1);
  }

  return (
    <div>
      <div>
        <button onClick={chNum}>1</button>
        <button onClick={chNum}>2</button>
        <button onClick={chNum}>3</button>
      </div>

      <div>
        내가 입력한 숫자 : {InputNum}
        <br />
        랜덤한 숫자 : {ranNum}
        <br />
        결과 : {InputNum == ranNum ? <b>일치!</b> : <b>불일치!</b>}
      </div>
    </div>
  );
};

export default MyState02;
