function inputDisabled(check) {
  inputDatas.each(function (index, element) {
    if (element.type === "text") {
      //console.log(element);

      if (check) { //true
        element.setAttribute("disabled", "");
      } else {
        element.removeAttribute("disabled");
      }

    }
  });
}