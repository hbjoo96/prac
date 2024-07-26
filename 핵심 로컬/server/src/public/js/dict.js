// 흑백 이미지와 컬러 GIF의 경로를 저장하는 배열을 생성합니다.
const grayscaleImages = Array.from(
  { length: 150 },
  (_, i) => `../../public/images/grayscale_images(png)/${i + 1}.png`
);
const colorGifs = Array.from(
  { length: 150 },
  (_, i) => `../../public/images/color_gifs/${i + 1}.gif`
);

// 전역 변수 선언
let userPokemons = [];
let currentPage = 1;
const itemsPerPage = 12;

// 메인 렌더링 함수
function render() {
  renderData();
  renderPagination();
}

// 데이터 렌더링 함수
function renderData() {
  const dataContainer = document.getElementById("data-container");
  dataContainer.innerHTML = "";

  const start = (currentPage - 1) * itemsPerPage;
  const end = start + itemsPerPage;

  for (let i = start; i < end && i < 150; i++) {
    const img = document.createElement("img");
    const pokemonId = i + 1;

    if (userPokemons.includes(pokemonId)) {
      img.src = colorGifs[i];
    } else {
      img.src = grayscaleImages[i];
    }

    img.id = `${pokemonId}`;
    img.alt = `Pokemon ${pokemonId}`;
    img.addEventListener("click", openModal);
    dataContainer.appendChild(img);
  }
}

// 페이지네이션 렌더링 함수
function renderPagination() {
  const totalPages = Math.ceil(150 / itemsPerPage);
  const paginationContainer = document.getElementById("pagination");
  paginationContainer.innerHTML = "";

  for (let i = 1; i <= totalPages; i++) {
    const button = document.createElement("button");
    button.innerText = i;
    button.addEventListener("click", () => {
      currentPage = i;
      render();
    });

    if (i === currentPage) {
      button.classList.add("active");
    }

    paginationContainer.appendChild(button);
  }
}

// 사용자의 포켓몬 정보를 가져오고 이미지를 렌더링하는 함수
function fetchUserPokemonsAndRender() {
  axios
    .get("/dictionary/info", {
      params: {
        userId: sessionStorage.getItem("userEmail"),
      },
    })
    .then((res) => {
      userPokemons = res.data.rows.map((row) => row.poke_num);
      render(); // 데이터를 가져온 후 렌더링 실행
    })
    .catch((error) => {
      console.error("포켓몬 정보를 가져오는 데 실패했습니다:", error);
      render(); // 에러 발생 시에도 렌더링은 실행
    });
}

// 모달 열기 함수
function openModal(event) {
  const modal = document.getElementById("myModal");
  const modalImg = document.getElementById("img01");
  const captionText = document.getElementById("caption");

  modal.style.display = "block";
  modalImg.src = event.target.src;
  const pokemonId = Number(event.target.id);

  if (userPokemons.includes(pokemonId)) {
    captionText.innerText = `포켓몬 #${pokemonId} - 획득한 포켓몬입니다!`;
  } else {
    captionText.innerText = `포켓몬 #${pokemonId} - 아직 획득하지 못한 포켓몬입니다.`;
  }
}

// 모달 닫기 함수
function closeModal() {
  const modal = document.getElementById("myModal");
  modal.style.display = "none";
}

// 모달 외부 클릭 시 닫기
window.onclick = function (event) {
  const modal = document.getElementById("myModal");
  if (event.target === modal) {
    modal.style.display = "none";
  }
};

// 페이지 로드 시 실행
document.addEventListener("DOMContentLoaded", function () {
  fetchUserPokemonsAndRender();

  // 모달 닫기 버튼에 이벤트 리스너 추가
  const closeBtn = document.getElementsByClassName("close")[0];
  if (closeBtn) {
    closeBtn.onclick = closeModal;
  }
});
