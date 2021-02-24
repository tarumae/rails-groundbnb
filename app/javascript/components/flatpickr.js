export const init_flatpickr = () => {
  flatpickr(".datepickerstart", {
    dateFormat: "Y.m.d",
    minDate: "today",
    onChange: function (selectedDate) {
      flatpickr(".datepickerend", {
        minDate: new Date(selectedDate).fp_incr(28)
      })
    }
  })

  flatpickr(".datepickerend", {
    dateFormat: "Y.m.d",
    minDate: new Date().fp_incr(28)
  })
}
