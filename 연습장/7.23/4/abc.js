// 더미 데이터 생성
const data = Array.from({ length: 100 }, (_, i) => `Item ${i + 1}`);

// 페이지당 항목 수
const itemsPerPage = 10;
let currentPage = 1;

// 데이터와 페이지네이션을 렌더링하는 함수
function render() {
    renderData();
    renderPagination();
}

// 현재 페이지의 데이터를 렌더링하는 함수
function renderData() {
    const dataContainer = document.getElementById('data-container');
    dataContainer.innerHTML = '';

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const currentData = data.slice(start, end);

    currentData.forEach(item => {
        const div = document.createElement('div');
        div.textContent = item;
        dataContainer.appendChild(div);
    });
}

// 페이지네이션 버튼을 렌더링하는 함수
function renderPagination() {
    const pagination = document.getElementById('pagination');
    pagination.innerHTML = '';

    const totalPages = Math.ceil(data.length / itemsPerPage);

    for (let i = 1; i <= totalPages; i++) {
        const pageItem = document.createElement('div');
        pageItem.textContent = i;
        pageItem.classList.add('page-item');
        if (i === currentPage) {
            pageItem.classList.add('active');
        }

        pageItem.addEventListener('click', () => {
            currentPage = i;
            render();
        });

        pagination.appendChild(pageItem);
    }
}

// 초기 렌더링
render();

/*

바닐라 JavaScript로 페이지네이션을 구현하는 것은 초보자에게도 좋은 연습이 될 수 있습니다. 
페이지네이션은 많은 데이터를 여러 페이지에 나누어 보여주는 기능입니다. 
이를 위해 HTML, CSS, JavaScript 파일을 활용할 수 있습니다.

페이지네이션의 기본 개념
HTML: 데이터를 표시할 자리와 페이지 번호를 클릭할 수 있는 버튼을 생성합니다.
CSS: 페이지네이션 UI를 스타일링합니다.
JavaScript: 데이터를 나누고, 페이지를 이동할 때마다 데이터를 갱신합니다.

이 코드는 기본적인 페이지네이션 기능을 구현합니다. 데이터는 data 배열에 저장되고, 페이지당 항목 수는 itemsPerPage로 설정됩니다.
JavaScript는 현재 페이지에 맞는 데이터를 렌더링하고, 페이지 번호 버튼을 생성하여 클릭 이벤트를 처리합니다.

이 코드를 통해 바닐라 JS로 페이지네이션을 구현할 수 있으며, 이를 바탕으로 더 복잡한 기능을 추가해 나갈 수 있습니다.
*/