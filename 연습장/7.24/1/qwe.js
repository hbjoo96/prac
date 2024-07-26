const images = Array.from({ length: 20 }, (_, i) => `images/image${i + 1}.jpg`);
const itemsPerPage = 10;
let currentPage = 1;

function render() {
    renderData();
    renderPagination();
}

function renderData() {
    const dataContainer = document.getElementById('data-container');
    dataContainer.innerHTML = '';
    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const currentData = images.slice(start, end);

    currentData.forEach((src, index) => {
        const img = document.createElement('img');
        img.src = src;
        img.id = `image${start + index + 1}`;
        img.alt = `Image ${start + index + 1}`;
        img.addEventListener('click', openModal);
        dataContainer.appendChild(img);
    });
}

function renderPagination() {
    const pagination = document.getElementById('pagination');
    pagination.innerHTML = '';
    const totalPages = Math.ceil(images.length / itemsPerPage);

    const prevPage = document.createElement('div');
    prevPage.textContent = '<';
    prevPage.classList.add('page-item');
    if (currentPage === 1) {
        prevPage.classList.add('disabled');
    }
    prevPage.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            render();
        }
    });
    pagination.appendChild(prevPage);

    const nextPage = document.createElement('div');
    nextPage.textContent = '>';
    nextPage.classList.add('page-item');
    if (currentPage === totalPages) {
        nextPage.classList.add('disabled');
    }
    nextPage.addEventListener('click', () => {
        if (currentPage < totalPages) {
            currentPage++;
            render();
        }
    });
    pagination.appendChild(nextPage);
}

// 모달창 관련 기능
const modal = document.getElementById('myModal');
const modalImg = document.getElementById('modalImage');
const captionText = document.getElementById('caption');
const span = document.getElementsByClassName('close')[0];

function openModal(event) {
    modal.style.display = 'block';
    modalImg.src = event.target.src;
    captionText.innerHTML = event.target.alt;
}

span.onclick = function() {
    modal.style.display = 'none';
}

window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = 'none';
    }
}

render();
