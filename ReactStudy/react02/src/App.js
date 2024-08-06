import logo from "./logo.svg";
import "./App.css";

// JSX : JavaScript와 HTML을 한번에 사용할 수 있는 문법
//  왜 배울까요 ? 사용자 정의태그(컴포넌트)를 만드는 방법이기 때문에!

// JSX는 문법이기 때문에 규칙을 가지고 있다.
// 규칙1. 출력하고자하는 태그들은 반드시 하나의 부모요소로 묶여있어야 한다.
// 규칙2. 표현식 사용 가능하다.(JavaScript 변수를 html에서 출력할 수 있다.)
// 규칙3. 모든 태그는 반드시 여는 태그와 닫는 태그가 존재한다.
// 규칙4. class --> className을 사용한다!

function App() {
  let name = "홍길동";
  console.log(`${name}님 환영합니다.`);

  return (
    <div>
      <h1>MyReact01</h1>
      <h1>MyReact02</h1>

      <p> {name}님 환영합니다. </p>

      {/* 닫는태그가 필요없었던 태그들인데, 여기에서는 닫는태그 같이 사용해야함. */}
      <br></br>
      <input></input>
      <img></img>
    </div>
  );
}

export default App;
