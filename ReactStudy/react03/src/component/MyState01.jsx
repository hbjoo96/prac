import React from "react";
import { useState } from "react";

// React Hook : 함수형 컴포넌트에서 사용되어지는 기능
// useState : state변수를 생성할 수 있는 기능

// 리액트에서는 일반 변수와 화면에 출력할 변수 (state 변수)를 구분한다.

const MyState01 = () => {
  // useState를 이용해서 state변수를 생성 구조
  // num : state 변수
  // setnum : state변수를 바꿀 수 있는 함수
  // useState(0) : state 변수의 초기값을 0으로 설정하겠습니다.
  // 비구조 할당
  const [num, setNum] = useState(0);

  // let num = 0;

  function plus() {
    // num++;
    setNum(num + 1);
    // num의 값을 바꿔서 다시 출력할꺼다 --> 재렌더링
    // --> 해당 컴포넌트를 다시 실행시킬꺼다
    console.log(num + 1);

    // setState의 특징 : 클로저 함수다(제일 마지막에 실행된다!!)
    // setNum(num+1)
  }
  function minus() {
    // num--;
    setNum(num - 1);
    console.log(num - 1);
  }

  return (
    <div>
      <h1>{num}</h1>
      <button onClick={plus}>+1</button>
      <button onClick={minus}>-1</button>
    </div>
  );
};

export default MyState01;
