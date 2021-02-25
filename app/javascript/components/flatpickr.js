export const init_flatpickr = () => {
  flatpickr(".datepickerstart", {
    dateFormat: "Y.m.d",
    minDate: "today",
    onChange: function (selectedDate) {
      flatpickr(".datepickerend", {
        minDate: new Date(selectedDate).fp_incr(30)
      })
    }
  })

  flatpickr(".datepickerend", {
    dateFormat: "Y.m.d",
    minDate: new Date().fp_incr(30),
  })
}

export const totalprice = () => {
  let end_date = document.querySelector(".datepickerend");
  if (end_date) {

    end_date.addEventListener("change", function () {
      // This still needs tweaking. Currently if you choose to rent for 1.5 months for example, it will only show total price for 1 month.
      let start_date = new Date(document.querySelector(".datepickerstart").value);
      let end_date = new Date(document.querySelector(".datepickerend").value);
      let price = parseInt(document.querySelector(".price").innerText);
      let months = (end_date.getFullYear() - start_date.getFullYear()) * 12;
      months -= start_date.getMonth();
      months += end_date.getMonth();
      document.querySelector(".totalprice").innerHTML = `Total Price: £${months === 0 ? price : price * months}`;
    });
  }
}

