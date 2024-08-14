import React from "react";
import { useState, useRef, useEffect } from "react";

const MyToDo = () => {
  const [inputText, setInputText] = useState([]);
  const inputRef = useRef();

  function inputTodo() {
    // input태그에 적은 값을 가져와서 ul태그 안으로 출력
    // 기존에 있던 배열에 input태그에서 입력한 내용을 추가
    // push 사용해서 state 배열 반환 x
    // --> push 자체가 기존 state배열을 바꾸는 기능이기 때문에
    // (state 값을 바꿀 수 있는 것는 setState만 가능하기 때문!!)

    // concat : 기존 배열에 데이터를 추가한 모습으로 새로운 배열을 생성하는 기능
    setInputText(inputText.concat(inputRef.current.value));
    // console.log(inputRef.current.value);

    // 제대로 동작 안하는 이유 : set함수가 close함수이기에 맨 마지막에 실행됨
  }
  // state 변수에 의해서 실행되어지는 함수
  // state 변수에 지정되는 함수를 만들겠다

  // useEffect : 함수 컴포넌트에서 LifeCycle을 기준으로 실행시키는 함수
  // useEffect = componentDidMount + componentDidupdate
  useEffect(() => {
    // 최대 목표 개수에 도달했습니다!
    console.log("useEffect"); // --> 랜더링 확인 가능!

    if (inputText.length == 5) {
      alert("최대 목표 개수에 도달했습니다!");
    }
  });

  function del_Btn(e) {
    // 배열에 있는 요소 중 사용자가 선택한 요소를 삭제하겠습니다.
    // 1. 어떻게 삭제할 수 있을까
    // 2. 사용자가 어떤 요소를 선택했는지 알 수 있을까?
    // 3. 넘겨 받은 인덱스 값을 제외한 다른 요소 만으로 배열을 바꾸고 싶어요!
    // setInputText(
    //   inputText.filter((data) => data != inputText[e.target.className])
    // );
    // setInputText(
    //   inputText.filter((data) => data != e.target.getAttribute("value"))
    // );
    setInputText(inputText.filter((data, index) => index !== e));
    // data를 사용하지 않는데 굳이 쓰는 이유: 이름이 중요한게 아니라 순서가 중요한 것, 첫번째 오는 매개변수에는 데이터가 들어가기 때문에 사용해야함 / 아니면 >>(_,index)<< 이 형태도 가능
    // console.log(e.target.className);
    // console.log(inputText);
    // console.log(e);
  }

  return (
    <div>
      <h1>2024 올해는 꼭 해봅시다!</h1>
      <input ref={inputRef}></input>
      <button onClick={inputTodo}>계획추가</button>

      <hr />
      <h1>TodoList</h1>
      <ul>
        {/* 목록출력 */}
        {inputText.map((data, index) => (
          <li>
            {data}
            {/* <button className={index} onClick={del_Btn}> */}
            <button onClick={() => del_Btn(index)}>
              {/* <button onClick={del_Btn}> */}
              삭제
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default MyToDo;
