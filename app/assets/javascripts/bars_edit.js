$(".bars.edit").ready(function() {
  var sun_ctx = document.getElementById("sundayChart");
  var sundayChart = new Chart(sun_ctx, {
    type: 'doughnut',
    data: { 
      datasets: [{
        data: "<%= @presenter.day_choices('Sunday') %>",
        backgroundColor: [
          'rgba(122, 40, 42, 1)',
          'rgba(169, 179, 100, 1)'
        ],
      }],
    },
    options: Chart.defaults.doughnut.tooltips.enabled = false
  });
  var mon_ctx = document.getElementById("mondayChart");
  var mondayChart = new Chart(mon_ctx, {
      type: 'doughnut',
      data: { 
        datasets: [{
          data: "<%= @presenter.day_choices('Monday') %>",
          backgroundColor: [
            'rgba(122, 40, 42, 1)',
            'rgba(169, 179, 100, 1)'
          ],
        }],
      },
      options: Chart.defaults.doughnut.tooltips.enabled = false
  });
  var tues_ctx = document.getElementById("tuesdayChart");
  var tuesdayChart = new Chart(tues_ctx, {
      type: 'doughnut',
      data: { 
        datasets: [{
          data: "<%= @presenter.day_choices('Tuesday') %>",
          backgroundColor: [
            'rgba(122, 40, 42, 1)',
            'rgba(169, 179, 100, 1)'
          ],
        }],
      },
      options: Chart.defaults.doughnut.tooltips.enabled = false
  });
  var weds_ctx = document.getElementById("wednesdayChart");
  var wednesdayChart = new Chart(weds_ctx, {
      type: 'doughnut',
      data: { 
        datasets: [{
          data: "<%= @presenter.day_choices('Wednesday') %>",
          backgroundColor: [
            'rgba(122, 40, 42, 1)',
            'rgba(169, 179, 100, 1)'
          ],
        }],
      },
      options: Chart.defaults.doughnut.tooltips.enabled = false
  });
  var thurs_ctx = document.getElementById("thursdayChart");
  var thursdayChart = new Chart(thurs_ctx, {
      type: 'doughnut',
      data: { 
        datasets: [{
          data: "<%= @presenter.day_choices('Thursday') %>",
          backgroundColor: [
            'rgba(122, 40, 42, 1)',
            'rgba(169, 179, 100, 1)'
          ],
        }],
      },
      options: Chart.defaults.doughnut.tooltips.enabled = false
  });
  var fri_ctx = document.getElementById("fridayChart");
  var fridayChart = new Chart(fri_ctx, {
      type: 'doughnut',
      data: { 
        datasets: [{
          data: "<%= @presenter.day_choices('Friday') %>",
          backgroundColor: [
            'rgba(122, 40, 42, 1)',
            'rgba(169, 179, 100, 1)'
          ],
        }],
      },
      options: Chart.defaults.doughnut.tooltips.enabled = false
  });
  var sat_ctx = document.getElementById("saturdayChart");
  var saturdayChart = new Chart(sat_ctx, {
      type: 'doughnut',
      data: { 
        datasets: [{
          data: "<%= @presenter.day_choices('Saturday') %>",
          backgroundColor: [
            'rgba(122, 40, 42, 1)',
            'rgba(169, 179, 100, 1)'
          ],
        }],
      },
      options: Chart.defaults.doughnut.tooltips.enabled = false
  });
  $(document).ready(function(){
  setTimeout(function(){
    $('#flash').remove();
  }, 4000);
  })
})
