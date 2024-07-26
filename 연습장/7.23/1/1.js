const data = [
    { title: '패턴', postNumber: 1 },
    { title: '마음가짐', postNumber: 2 },
    { title: 'HTML 기초', postNumber: 3 },
    { title: 'css 기초', postNumber: 4 },
    { title: 'CSSflex', postNumber: 5 },
    { title: 'Mac 계산기 클론하기', postNumber: 6 },
    { title: 'CSS grid', postNumber: 7 },
    { title: 'slice? splice', postNumber: 8 },
    { title: '함수를 정의하는 방법', postNumber: 9 },
    { title: '순열(Permutation) 구현하기', postNumber: 10 },
    { title: '문자열에서 특정 위치의 문자를 변경하고 싶은 경우', postNumber: 11 },
    { title: 'letIt const', postNumber: 12 },
    { title: 'nvm', postNumber: 13 },
    { title: '요소 노드의 텍스트 조작하기(nodeValue, textContent, innerHTML)', postNumber: 14 },
    { title: '자바스크립트의 배열은 배열이 아니다!', postNumber: 15 },
    { title: 'JSON 다루기(JSON.parse), JSON.stringify())', postNumber: 16 },
    { title: '원시 자료형과 참조 자료형', postNumber: 17 },
    { title: '[]===[]는 왜 false인가', postNumber: 18 },
    { title: 'this (동적 바인딩)', postNumber: 19 },
    { title: '유효성 검사를 포함한 간단한 회원가입 폼 페이지 만들기', postNumber: 20 },
    { title: '#fff와 #ffffff', postNumber: 21 },
    { title: '안다고 생각했지만, 헷갈렸던 문법들', postNumber: 22 },
    { title: 'DOM이 뭔가요?', postNumber: 23 },
    { title: '영화 좌석 예약 페이지 만들기 ', postNumber: 24 },
    { title: '테두리가 두 줄처럼 보이는 경우 (border)', postNumber: 25 },
    {
      title: 'IS0 형식의 날짜(yyyy-mm-ddThh:mm:ssz)를 현재 위치 시간대로 변경하기 # ',
      postNumber: 26,
    },
    { title: '페이지네이션', postNumber: 27 },
  ];

  const COUNT_PER_PAGE = 6; // 한 페이지 당 최대 6개의 요소를 보여줄 것

const getTotalPageCount = () => {
  return Math.ceil(data.length / COUNT_PER_PAGE);
};

const numberButtonWrapper = document.querySelector('.number-button-wrapper');

const setPageButtons = () => {
  numberButtonWrapper.innerHTML = ''; // 페이지 번호 wrapper 내부를 비워줌

  for (let i = 1; i <= getTotalPageCount(); i++) {
    numberButtonWrapper.innerHTML += `<span class="number-button"> ${i} </span`;
  }
};

const ul = document.querySelector('ul');
let currentPage = 1;

const setPageOf = (pageNumber) => {
  ul.innerHTML = ''; // ul 리스트 내부를 비워줌

  for (
    let i = COUNT_PER_PAGE * (pageNumber - 1) + 1;
    i <= COUNT_PER_PAGE * (pageNumber - 1) + 6 && i <= data.length;
    i++
  ) {
    const li = document.createElement('li');

    // 컨테이너
    const postContainer = document.createElement('div');
    postContainer.className = 'post-container';

    // 글 번호
    const postNumber = document.createElement('p');
    postNumber.className = 'post-number';

    // 글 제목
    const postTitle = document.createElement('p');
    postTitle.className = 'post-title';

    postNumber.textContent = data[i - 1].postNumber;
    postTitle.textContent = data[i - 1].title; // 페이지 번호는 1부터 시작하지만 배열 인덱스는 0부터 시작하므로 -1 해 준다.

    postContainer.append(postNumber, postTitle); // 컨테이너 구성
    li.append(postContainer); // li 구성
    ul.append(li); // ul에 li 자식 요소로 넣어주기
  }
};

const pageNumberButtons = document.querySelectorAll('.number-button');

pageNumberButtons.forEach((numberButton) => {
  numberButton.addEventListener('click', (e) => {
    setPageOf(+e.target.innerHTML);
  });
});

const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');

prevButton.addEventListener('click', () => {
  if (currentPage > 1) {
		currentPage -= 1;
    setPageOf(currentPage);
  }
});

nextButton.addEventListener('click', () => {
  if (currentPage < getTotalPageCount()) {
		currentPage += 1;
    setPageOf(currentPage);
  }
});

const moveSelectedPageHighlight = () => {
    pageNumberButtons.forEach((numberButton) => {
      if (numberButton.classList.contains('selected')) {
        numberButton.classList.remove('selected');
      }
    });
  
    pageNumberButtons[currentPage - 1].classList.add('selected');
  };