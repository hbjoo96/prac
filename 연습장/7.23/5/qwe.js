// 로컬 이미지 파일 경로 배열 생성 (여기서는 20개의 샘플 이미지 경로 사용)
const images = Array.from({ length: 150 }, (_, i) => `grayscale_images(png)/${i + 1}.png`);


// 페이지당 항목 수 설정
const itemsPerPage = 12;
// 현재 페이지 번호 설정
let currentPage = 1;

// 데이터를 표시하고 페이지네이션 버튼을 렌더링하는 함수
function render() {
    renderData();
    renderPagination();
}

// 현재 페이지의 데이터를 렌더링하는 함수
function renderData() {
    const dataContainer = document.getElementById('data-container');
    dataContainer.innerHTML = '';

    // 현재 페이지에 해당하는 데이터 범위를 계산
    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const currentData = images.slice(start, end);

    // 현재 페이지의 데이터를 HTML에 추가
    currentData.forEach(src => {
        const img = document.createElement('img');
        img.src = src;
        dataContainer.appendChild(img);
    });
}

// 페이지네이션 버튼을 렌더링하는 함수
function renderPagination() {
    const pagination = document.getElementById('pagination');
    pagination.innerHTML = '';

    // 총 페이지 수 계산
    const totalPages = Math.ceil(images.length / itemsPerPage);

    // 이전 페이지 버튼 생성
    const prevPage = document.createElement('div');
    prevPage.textContent = '<';
    prevPage.classList.add('page-item');
    // 첫 페이지에서는 비활성화
    if (currentPage === 1) {
        prevPage.classList.add('disabled');
    }
    // 클릭 이벤트 추가: 첫 페이지가 아닐 경우 이전 페이지로 이동
    prevPage.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            render();
        }
    });
    pagination.appendChild(prevPage);

    // 다음 페이지 버튼 생성
    const nextPage = document.createElement('div');
    nextPage.textContent = '>';
    nextPage.classList.add('page-item');
    // 마지막 페이지에서는 비활성화
    if (currentPage === totalPages) {
        nextPage.classList.add('disabled');
    }
    // 클릭 이벤트 추가: 마지막 페이지가 아닐 경우 다음 페이지로 이동
    nextPage.addEventListener('click', () => {
        if (currentPage < totalPages) {
            currentPage++;
            render();
        }
    });
    pagination.appendChild(nextPage);
}

// 초기 렌더링 호출
render();
