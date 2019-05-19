<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>热力图</title>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>
    <style>
        html,
        body,
        #container {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<div id="container"></div>
<div class="input-card" style="width:20rem;background-color:transparent;box-shadow:none">
    <div class="input-item">
        <input type="button" class="btn" id='default' value="默认样式测距" style='margin-right: 1rem;'/>
    </div>
</div>
<script src="https://webapi.amap.com/maps?v=1.4.14&key=45cee1fce3ab25db55c78cb468262a1c&plugin=AMap.RangingTool"></script>
<%--<script src="https://a.amap.com/jsapi_demos/static/resource/heatmapData.js"></script>--%>
<script>
    var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [116.418261, 39.921984],
        zoom: 11
    });

    //map.setFeatures("road");    // 单一种类要素显示
    //map.setFeatures(['road', 'building'])   // 多个种类要素显示

    // 测量距离
    // map.plugin(['Amap.MouseTool'], function(){
    //     var mousetool = new Amap.MouseTool(map);
    //     mousetool.rule();
    // });
    //默认样式
    //var ruler1 = new AMap.RangingTool(map);
    //启用默认样式测距
    // document.getElementById('default').onclick=function(){
    //     ruler1.turnOn();
    // }

    // 工具条
    // map.plugin(["AMap.ToolBar"],function(){
    //     //加载工具条
    //     var tool = new AMap.ToolBar();
    //     map.addControl(tool);
    // });

    // var map = new AMap.Map('container', {
    //     resizeEnable: true,
    //     rotateEnable:true,
    //     pitchEnable:true,
    //     zoom: 17,
    //     pitch:80,
    //     rotation:-15,
    //     viewMode:'3D',//开启3D视图,默认为关闭
    //     buildingAnimation:true,//楼块出现是否带动画

    //     expandZoomRange:true,
    //     zooms:[3,20],
    //     center:[116.333926,39.997245]
    // });

    var points = [{"count":4,"lat":40.258186,"lng":116.225404},{"count":4,"lat":39.99243,"lng":116.272876},{"count":6,"lat":39.937209,"lng":116.38631},{"count":5,"lat":39.918058,"lng":116.397026},{"count":4,"lat":39.989743,"lng":116.399466},{"count":2,"lat":39.881949,"lng":116.410886},{"count":5,"lat":40.417555,"lng":116.544079}];

    var heatmap;
    map.plugin(["AMap.Heatmap"], function () {
        //初始化heatmap对象
        heatmap = new AMap.Heatmap(map, {
            radius: 25, //给定半径
            opacity: [0, 0.8]
            /*,
            gradient:{
                0.5: 'blue',
                0.65: 'rgb(117,211,248)',
                0.7: 'rgb(0, 255, 0)',
                0.9: '#ffea00',
                1.0: 'red'
            }
             */
        });
        //设置数据集：该数据为北京部分“公园”数据
        heatmap.setDataSet({
            //data: heatmapData,
            data: points,
            //max: 100
            max: 1
        });
    });

    if (!isSupportCanvas()) {
        alert('热力图仅对支持canvas的浏览器适用,您所使用的浏览器不能使用热力图功能,请换个浏览器试试~')
    }

    //判断浏览区是否支持canvas
    function isSupportCanvas() {
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }
</script>
</body>
</html>
