import React from "react";
import { useRef } from "react";

const MyRef02 = () => {
  // 배열 사용해서 이미지 데이터 다루기
  // useRef, useState 이용해서
  //   const pokePic = ["images/1.gif", "images/2.gif", "images/3.gif"];
  //   const imgRef = useRef();
  //   const [Pic, setPic] = useState("");

  //   function changePic() {
  //     setPic(imgRef.current.src);
  //   }
  const pokePic = ["./images/1.gif", "./images/2.gif", "./images/3.gif"];
  const imgRef = useRef();
  let pos = 0; // 현재 이미지 위치

  function nextImg(e) {
    pos++;
    if (pos > 2) {
      pos = 0;
    }
    imgRef.current.src = pokePic[pos];
  }
  function beforeImg(e) {
    pos--;
    if (pos < 0) {
      pos = 2;
    }
    imgRef.current.src = pokePic[pos];
  }

  return (
    <div>
      <img ref={imgRef} src="./images/1.gif"></img>
      <br></br>
      <button onClick={beforeImg}>Before</button>
      <button onClick={nextImg}>Next</button>
    </div>
  );
};

export default MyRef02;
