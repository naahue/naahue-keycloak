// Logic for OTP input

const inputAndChange = (e) => {
  e.target.addEventListener("input", () => {
    e.target.value = e.target.value.replace(/[^0-9]|(\..*?)\..*/g, "")
  });
  
  const inputs = document.querySelectorAll(".otp-field input");

  let i = 0;
  let code = "";

  while (i < inputs.length && inputs[i].value != "") {
    let input = e.target;
    if (input.value != "" && input.nextElementSibling != null) {
      input.nextElementSibling.focus();
    } else if (e.key == "Backspace") {
      input.previousElementSibling.focus();
    }
    code += inputs[i].value;
    i++;
  }
  if(code.length == inputs.length){
    document.getElementById("kc-submit").removeAttribute("disabled");
    document.getElementById("code").value = code;
  }else{
    document.getElementById("kc-submit").setAttribute("disabled", "");
    document.getElementById("code").value = "";
  }
}

// Paste code from clipboard

const pasteCode = (e) => {
  e.preventDefault();
  const text = e.clipboardData.getData("text/plain");
  const inputs = document.querySelectorAll(".otp-field input");

  let i = 0;
  let code = "";

  while (i < inputs.length) {
    inputs[i].value = text[i] || "";
    code += inputs[i].value;
    i++;
  }
  document.getElementById("code").value = code;
}