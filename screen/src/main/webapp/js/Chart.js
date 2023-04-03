

new Chart(document.getElementById("bar-chart"), {
	type: 'bar',
	data: {
		labels: ["0.5점","1점", "1.5점","2점", "2.5점",
		"3점","3.5점","4점", "4.5점", "5점"],
		datasets: [
			{
				label: "평가한 개수",
				/*backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"]*/
				backgroundColor: ["#3e95cd", "#3e95cd", "#3e95cd", "#3e95cd", "#3e95cd","#3e95cd", "#3e95cd", "#3e95cd", "#3e95cd", "#3e95cd"],
				data: [15, 20, 45, 32, 24, 0,15, 20, 45, 0],
			}
		]
	},
	options: {
		legend: { display: false },
		/*title: {
			display: true,
			text: '평점 분포도'
		},*/
		scales: { //지저분해서...y축 값하고 뒤에 그리드 삭제. 축 자체도 날리고 싶은데 속성을 몰르겟음 
			yAxes: [{
				ticks: {
					display: false 
				},
				gridLines:{
					display: false 
				}
			}],
			xAxes: [{
				gridLines:{
					display: false 
				}
			}]
		}
	}
});