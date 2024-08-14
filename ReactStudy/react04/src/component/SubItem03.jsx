import React from "react";
import { useContext } from "react";
import { TextContext } from "../App";
import { useRef } from "react";

const SubItem03 = () => {
  const data = useContext(TextContext);
  const inputref = useRef();
  function chText() {
    // console.log(inputref.current.value);
    data.setState(inputref.current.value);
  }
  return (
    <div>
      <input ref={inputref}></input>
      <button onClick={chText}>출력</button>
    </div>
  );
};

export default SubItem03;
