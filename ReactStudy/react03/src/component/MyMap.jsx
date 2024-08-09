import React from "react";

const MyMap = () => {
  const menu = ["짬뽕", "짜장면", "냉면", "탕수육"];

  // map, filter
  // map: 배열 안에 있는 요소들에 규칙을 부여해서 새로운 배열을 만든다
  // filter : 배열에 조건을 줘서 새로운 배열을 생성한다.

  return (
    <div>
      <ul>
        {/* data : 배열이 가지고 있는 요소가 순차적으로 돌아옴
            index : 배열 인덱스 값이 순차적으로 들어옴 */}
        {/* 콜백함수 : 함수 안에서 다른 함수가 호출되어 실행되어지는 함수 */}
        {menu.map((data, index) => (
          <li key={index}>{data}</li>
        ))}
        <hr></hr>
        {/* menu 배열 중 탕수육을 제외한 나머지만 출력 */}
        {menu
          .filter((data) => data != "탕수육")
          .map((data, index) => (
            <li key={index}>{data}</li>
          ))}

        {/* {menu.filter()} */}
        {/* <li>{menu[0]}</li>
        <li>{menu[1]}</li>
        <li>{menu[2]}</li>
        <li>{menu[3]}</li> */}
      </ul>
    </div>
  );
};

export default MyMap;
