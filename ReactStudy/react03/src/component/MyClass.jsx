import React, { Component } from "react";
// import {useState} from 'react' -> 사용 불가능 / 클래스 컴포넌트에서 사용되지 않음

export class MyClass extends Component {
  // LifeCycle 함수
  // -> 컴포넌트 생명주기에 맞춰서 실행되어지는 함수들

  // 1. componentDidMount
  // --> 컴포넌트가 맨처음 렌더링 될때 실행하겠습니다
  // (화면으로 처음 보여졌을때)
  componentDidMount() {
    console.log("Mount 단계");
  }

  // 2. componentDidUpdate
  // --> 컴포넌트가 재렌더링 될때 실행하겠습니다.
  // (state 값이 변경, props 변경)
  componentDidUpdate() {
    console.log("Update 단계");
    // 출력 숫자가 10에 도달하면 '목표 숫자에 도달했습니다' 출력
    if (this.state.num == 10) {
      alert("목표숫자 도달");
    }
  }
  // class 컴포넌트 state 변수 생성
  state = {
    num: 0,
  };
  // --> 자동적으로 state변수로 인식

  render() {
    return (
      <div>
        <h1>{this.state.num}</h1>
        {/* class 컴포넌트 setState 사용법 */}
        <button onClick={() => this.setState({ num: this.state.num + 1 })}>
          +1
        </button>
        <button onClick={() => this.setState({ num: this.state.num - 1 })}>
          -1
        </button>
      </div>
    );
  }
}

export default MyClass;
