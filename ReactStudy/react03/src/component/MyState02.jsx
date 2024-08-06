import React from "react";
import { useState } from "react";

const MyState02 = () => {
  // 1. 버튼 클릭시 어떤 버튼을 클릭했는지 숫자를 출력해주세요!
  // 2. 버튼 클릭시 1~3랜덤 수 생성 -> 랜덤 숫자 부분 출력
  const [num, setNum] = useState(0);
  const [ranNum, setRanNum] = useState(0);

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
  // function setNum() {}

  return (
    <div>
      <div>
        <button onClick={one}>1</button>
        <button onClick={two}>2</button>
        <button onClick={three}>3</button>
      </div>

      <div>
        내가 입력한 숫자 : {num}
        <br />
        랜덤한 숫자 : {ranNum}
        <br />
        {num == ranNum ? "일치!" : "불일치!"}
      </div>
    </div>
  );
};

export default MyState02;
