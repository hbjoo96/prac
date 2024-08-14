import React from "react";
import { useContext } from "react";
import { BoxContext } from "../App";

const Result = () => {
  const data = useContext(BoxContext);
  //   console.log(data);
  return (
    <div>
      <div
        style={{
          width: "100px",
          height: "100px",
          backgroundColor: data.state,
        }}
      ></div>
    </div>
  );
};

export default Result;
