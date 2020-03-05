function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
  }
  
  function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
  }
  google.charts.load('current', {'packages':['gantt']});
  google.charts.setOnLoadCallback(drawChart);

  function toMilliseconds(minutes) {
    return minutes * 60 * 1000;
  }

  function drawChart() {

    
    //quando eu passar o mouse sobre uma determinada tarefa de um projeto, as informacoes abaixo aparecerao
    var otherData = new google.visualization.DataTable();
    otherData.addColumn('string', 'Task ID');
    otherData.addColumn('string', 'Task Name');
    otherData.addColumn('string', 'Resource');
    otherData.addColumn('date', 'Start');
    otherData.addColumn('date', 'End');
    otherData.addColumn('number', 'Duration');
    otherData.addColumn('number', 'Percent Complete');
    otherData.addColumn('string', 'Dependencies');

    
    //Estes dados abaixo devem vir do backend da app
    //Mas antes de trazê-los do backend, faca experimentos aqui no frontend mesmo
    //E lembre-se: como estamos utilizando a arquitetura REST, nosso backend pode ser aquele Java que passei em aula, pode ser Python, e etc
    
    otherData.addRows([
      ['toTrain', 'Walk to train stop', 'walk', null, null, toMilliseconds(5), 100, null],
      ['music', 'Listen to music', 'music', null, null, toMilliseconds(70), 100, null],
      ['wait', 'Wait for train', 'wait', null, null, toMilliseconds(10), 100, 'toTrain'],
      ['train', 'Train ride', 'train', null, null, toMilliseconds(45), 75, 'wait'],
      ['toWork', 'Walk to work', 'walk', null, null, toMilliseconds(10), 0, 'train'],
      ['work', 'Sit down at desk', null, null, null, toMilliseconds(2), 0, 'toWork'],

    ]);

    var options = {
      height: 275,
      gantt: {
        defaultStartDateMillis: new Date(2015, 3, 28)
      }
    };

    //nesta linha abaixo ele pega todas as configuracoes criadas do grafico e joga em uma div do html com id "chart_div"
    var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

    chart.draw(otherData, options);
  }