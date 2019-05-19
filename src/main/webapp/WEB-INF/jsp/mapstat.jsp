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
<script>
    var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [116.418261, 39.921984],
        zoom: 11
    });

    map.plugin(["AMap.ToolBar"],function(){
        //加载工具条
        var tool = new AMap.ToolBar();
        map.addControl(tool);
    });

    // 坐标点
    var points = ${data_json};

    console.log(points);

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

        heatmap.setDataSet({
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
