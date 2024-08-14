import React from "react";
import SubItem03 from "./SubItem03";
import { useContext } from "react";
import { TextContext } from "../App";

const SubItem02 = () => {
  const data = useContext(TextContext);
  return (
    <div>
      {data.state}
      <SubItem03></SubItem03>
    </div>
  );
};

export default SubItem02;
