import React from "react";
import SubItem02 from "./SubItem02";
import { useContext } from "react";
import { TextContext } from "../App";

const SubItem01 = () => {
  const data = useContext(TextContext);
  //   console.log(data);
  return (
    <div>
      {data.state}
      <SubItem02></SubItem02>
    </div>
  );
};

export default SubItem01;
