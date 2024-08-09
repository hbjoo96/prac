import React from "react";
import { useState } from "react";

const MyState03 = () => {
  let myStyle = {
    border: "1px solid lightgrey",
    width: "60%",
    height: "100px",
    marginBottom: "10px",
    textAlign: "left",
  };
  const [num, setNum] = useState(0);

  function plus() {
    setNum(num + 1);
  }
  function minus() {
    if (num > 0) {
      setNum(num - 1);
      // setNum은 마지막으로 실행되기 때문에 조건을 걸어주기 위해서는 전체적으로 실행해야된다.
    }
  }
  function reset() {
    setNum(0);
  }

  return (
    <div style={myStyle}>
      <div>Like! ♥ {num}</div>
      <div>
        <button onClick={plus}>+1증가</button>
        <button onClick={minus}>-1감소</button>
        <button onClick={reset}>초기화</button>
      </div>
    </div>
  );
};

export default MyState03;
