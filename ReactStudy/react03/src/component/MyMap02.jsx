import React from "react";
import { useState } from "react";

const MyMap02 = () => {
  const colorArray = ["red", "orange", "yellow", "green", "blue"];
  const [col, setCol] = useState("black");
  function colorSet(e) {
    // 두번째 줄에 있는 div 태그 색상 변경
    // console.log(colorArray[e.target.className]);
    // console.log(e.target.getAttribute('value)); -- 수업
    setCol(colorArray[e.target.className]);
  }

  /*
  let myStyle={
        width : '100px',
        height : '100px',
        display : 'inline-block'
  } -- 수업
  */

  return (
    <div>
      <b>색상 변경하기</b>
      <br></br>
      {colorArray.map((data, index) => (
        <div
          key={index}
          //   value={data} -- 수업
          className={index}
          style={{
            width: "100px",
            height: "100px",
            display: "inline-block",
            backgroundColor: data,
          }}
          // ...(스프레드) : 객체 or 배열이 가지고 있는 내용을 펼치겠습니다
          /* style={{...myStyle, backgroundColor : data}} -- 수업 */
          onClick={colorSet}
        ></div>
      ))}
      <hr />
      <div
        style={{
          width: "100px",
          height: "100px",
          backgroundColor: col,
        }}
      ></div>
    </div>
  );
};

export default MyMap02;
