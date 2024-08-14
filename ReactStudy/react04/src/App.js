// import logo from "./logo.svg";
import "./App.css";
// import Left01 from "./component/Left01";
// import Right01 from "./component/Right01";
import { useState } from "react";
import { createContext } from "react";
import SubItem01 from "./component/SubItem01";
import Mycolor from "./component/Mycolor";
import Result from "./component/Result";

// 공유공간(context) 생성
export const AppContext = createContext();
export const TextContext = createContext();
export const BoxContext = createContext();

function App() {
  // const [num, setNum] = useState(0);
  // const [text, setText] = useState("");
  // num, setNum을 Left01과 Right01로 넘겨서(전달)
  // Right01에 있는 버튼을 클릭했을때
  // Left01에 있는 숫자를 바꾸고 싶습니다.
  const [color, setColor] = useState("black");

  return (
    <div /*id="container"*/>
      <h1>Root</h1>
      <div /*id="grid"*/>
        {/* 
          Provider : 공유공간 허용하겠습니다
          --> 허용된 컴포넌트의 자식 컴포넌트까지 전부 허용 가능함

          value : 공유공간에서 공유하며 사용할 공유값을 지정
        */}
        {/* <AppContext.Provider value={{ state: num, setState: setNum }}>
          <Left01></Left01>
          <Right01></Right01>
        </AppContext.Provider> */}
        {/* <h1>Context 실습</h1>
        <h1>{text}</h1>
        <TextContext.Provider value={{ state: text, setState: setText }}>
          <SubItem01></SubItem01>
        </TextContext.Provider> */}
      </div>
      <div id="App">
        <h1>실습2</h1>
        <BoxContext.Provider value={{ state: color, setState: setColor }}>
          <Mycolor></Mycolor>
          <hr></hr>
          <Result></Result>
        </BoxContext.Provider>
      </div>
    </div>
  );
}

export default App;
