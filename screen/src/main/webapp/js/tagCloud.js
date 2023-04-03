/**
 * ---------------------------------------
 * This demo was created using amCharts 4.
 *
 * For more information visit:
 * https://www.amcharts.com/
 *
 * Documentation is available at:
 * https://www.amcharts.com/docs/v4/
 * ---------------------------------------
 */

am4core.useTheme(am4themes_animated);

am4core.useTheme(am4themes_animated);
var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());


series.data = [{/*태그 data*/
  "tag": "개그",
  "weight": 60
}, {
  "tag": "웹소설 원작",
  "weight": 80
}, {
  "tag": "서정적인",
  "weight": 90
}, {
  "tag": "학교생활",
  "weight": 25
}, {
  "tag": "로맨스",
  "weight": 30
}, {
  "tag": "일상",
  "weight": 45
}, {
  "tag": "판타지",
  "weight": 160
}, {
  "tag": "걸크러쉬",
  "weight": 20
}, {
  "tag": "화려한",
  "weight": 78
}];

series.dataFields.word = "tag";
series.dataFields.value = "weight";

series.labels.template.text = "{word}";