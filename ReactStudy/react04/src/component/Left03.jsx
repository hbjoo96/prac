import React from "react";
import { useContext } from "react"; // 공유공간에 접근할 수 있는 기능
import { AppContext } from "../App"; // 공유공간을 지정하는 기능

const Left03 = () => {
  // data : 공유되고 있는 값
  const data = useContext(AppContext);
  // console.log(data.state);

  return (
    <div>
      <h1>Left03</h1>
      <h1>{data.state}</h1>
    </div>
  );
};

export default Left03;
