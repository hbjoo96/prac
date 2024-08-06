import React from "react";

const MyTeam = (props) => {
  // JSX에서 inline style을 적용할때는
  // --> 객체 형식으로 적용해야 한다
  let myStyle = {
    border: "1px solid lightgrey",
    width: "60%",
    marginBottom: "10px",
    textAlign: "center",
  };
  return (
    <div style={myStyle} /* or {{border: "1px solid"}}*/>
      <p>{props.department}</p>
      <p>{props.name}</p>
    </div>
  );
};
// deflautProps : 데이터를 전달받지 않을때 기본적으로 적용되는 데이터
MyTeam.defaultProps = {
  name: "직원 선별중",
};

export default MyTeam;
