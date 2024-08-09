import React from "react";
import { useState, useRef } from "react";

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
  }
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
