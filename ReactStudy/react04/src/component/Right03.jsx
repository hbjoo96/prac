import React from "react";
import { useContext } from "react"; // 공유공간에 접근할 수 있는 기능
import { AppContext } from "../App"; // 공유공간을 지정하는 기능

const Right03 = () => {
  // 공유공간에 접근해서 state의 값을 바꾸고 싶어요!
  const data = useContext(AppContext);
  function chNum() {
    data.setState(data.state + 1);
  }
  return (
    <div>
      <h1>Right03</h1>
      <button onClick={chNum}>+1</button>
    </div>
  );
};

export default Right03;
