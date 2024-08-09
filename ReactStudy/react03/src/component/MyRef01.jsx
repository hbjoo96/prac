import React from "react";
import { useState, useRef } from "react";
// useRef : 컴포넌트에서 특정 태그를 선택할 수 있는 기능

const MyRef01 = () => {
  const inputRef = useRef();
  // 태그를 지정할 수 있는 inputRef라는 변수 생성

  const [InputText, setInputText] = useState("");
  const [InputText2, setInputText2] = useState("");

  function chInput() {
    // e.target : 이벤트를 발생시킨 주체(태그)
    // setInputText(document.getElementById("myText").value);

    // inputRef.current : 현재 가르키는 태그객체
    //                    태그를 바로 사용할 수 있게끔 객체로 가져오는 작업
    setInputText(inputRef.current.value);
  }

  function chInput2(e) {
    // e.target : 이벤트를 발생시킨 주체(태그)
    setInputText2(e.target.value);
  }

  return (
    <div>
      {/* 
       ref = {inputRef}
       해당 태그와 inputRef라는 변수를 대응하겠습니다
      */}
      <input id="myText" ref={inputRef} onChange={chInput2}></input>
      <button onClick={chInput}>출력</button>
      <h1>{InputText}</h1>
    </div>
  );
};

export default MyRef01;
