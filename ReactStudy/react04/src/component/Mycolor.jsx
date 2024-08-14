import React from "react";
import { useContext } from "react";
import { BoxContext } from "../App";

const Mycolor = () => {
  const colorArray = ["red", "orange", "yellow", "green", "blue"];
  const data = useContext(BoxContext);
  /* const shareData = useContext(BoxContext) */
  function colorSet(e) {
    // console.log(colorArray[e.target.className]);
    data.setState(colorArray[e.target.className]);
  }
  return (
    <div>
      {colorArray.map((data, index) => (
        <div
          key={index}
          className={index}
          style={{
            width: "100px",
            height: "100px",
            display: "inline-block",
            backgroundColor: data,
          }}
          onClick={colorSet}
          /*onClick={()=>shareData.setState(data)} --> 실행함수가 한줄이면 중괄호 생략가능*/
        ></div>
      ))}
    </div>
  );
};

export default Mycolor;
