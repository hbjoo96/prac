let Login = function () {
  const email = document.getElementById("email");
  const password = document.getElementById("pw");

  try {
    // axios으로 로그인 요청 (post)
    let res = axios({
      method: "POST",
      url: "https://reqres.in/api/login",
      data: {
        email: email.value,
        password: password.value,
      },
    });
    console.log(res);
    document.write(JSON.stringify(res));
  } catch (err) {
    console.log(err);
  }
};
