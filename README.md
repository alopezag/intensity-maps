# Intensity and speed maps (Tilemill)

Intensity and speed maps using Tilemill

<img width="981" alt="screen shot 2017-02-10 at 12 19 10" src="https://cloud.githubusercontent.com/assets/7943442/22825129/afc8033a-ef8b-11e6-82e7-562a84d2ce60.png">



<img width="965" alt="screen shot 2017-02-10 at 12 10 56" src="https://cloud.githubusercontent.com/assets/7943442/22825124/aa692856-ef8b-11e6-9658-512a16f35383.png">



**Tools:**

- Tilemill: https://tilemill-project.github.io/tilemill/
- QGis


## Export the tile

<img width="621" alt="screen shot 2017-02-10 at 09 02 49" src="https://cloud.githubusercontent.com/assets/7943442/22824530/9ed5092c-ef88-11e6-9f48-9361567a8a67.png">

- Remove any background or tile that are not needed.
- Choose the export option: `MBTiles`.
- Fill in the filename to export.
- Crop the area to export.
- Zoom: 0 - 15
- Click `export`

<img width="303" alt="screen shot 2017-02-10 at 09 02 25" src="https://cloud.githubusercontent.com/assets/7943442/22824545/a951fee6-ef88-11e6-8f79-d0c9eff6a5ab.png">


### Php script to read the MBTiles 

mbtiles.ftw2016.intensity.php
```php
<?php
$zoom = $_GET['z'];
$column = $_GET['x'];
$row = $_GET['y'];
$db = "ftw2016.bike.intensity.0-15.mbtiles";
  try
  {
    // Open the database
    $conn = new PDO("sqlite:$db");

    // Query the tiles view and echo out the returned image
    $sql = "SELECT * FROM tiles WHERE zoom_level = $zoom AND tile_column = $column AND tile_row = $row";
    $q = $conn->prepare($sql);
    $q->execute();

    $q->bindColumn(1, $zoom_level);
    $q->bindColumn(2, $tile_column);
    $q->bindColumn(3, $tile_row);
    $q->bindColumn(4, $tile_data, PDO::PARAM_LOB);

    while($q->fetch())
    {
    header("Content-Type: image/png");
    echo $tile_data;
    }
  }
  catch(PDOException $e)
  {
    print 'Exception : '.$e->getMessage();
  }
?>
```


### Visualize the MBTile

Place the files on a web server (e.g. apache2):

- MBTile
- PHP script

Create a html file as follows:

```html
<!DOCTYPE html>
<html>
<head>
  <title>Leaflet PHP/MBTiles Example</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.css" />
      <style>
        body {
            padding: 0;
            margin: 0;
        }
        html, body, #map {
            height: 100%;
            width: 100%;
        }
    </style>
</head>
<body>
  <div id="map"></div>
  <script src="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.js"></script>
  <script>
    var map;
    map = new L.Map("map",{
      zoom: 9,
      center: [51,4.2],
      maxZoom: 15
    });

    L.tileLayer("http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png", {
      maxZoom: 17
    }).addTo(map);

    L.tileLayer("mbtiles.ftw2016.intensity.php?z={z}&x={x}&y={y}", {
        tms: true,
        opacity: 0.7
    }).addTo(map);
  </script>
</body>
</html>
```


## Styles (CartoCSS)

### Intensity

<img width="731" alt="screen shot 2017-02-10 at 09 29 48" src="https://cloud.githubusercontent.com/assets/7943442/22824606/e3a677c0-ef88-11e6-9130-d7386da65de1.png">


```css
/*********
INTENSITY
**********/

// colours 
@red: #f34b55;
@yellow: #f5f369;
@lightblue: #5cd7f3;
@gray: #dddddd;
@scale: 2; 

#bike {
  line-join: round;
  line-cap: round;
  [density<=2]{line-width:2*@scale; line-color: @lightblue; }
  [density>2][density<=5]{line-width:4*@scale; line-color: @lightblue; }
  [density>5][density<=10]{
    ::case {
      line-width: 4.5*@scale;
      line-color: @lightblue;
      line-join: round;
      line-cap: round;
    }
    ::fill {
      line-width: 1*@scale;
      line-color:@yellow;
      line-join: round;
      line-cap: round;      
    }
  }
  [density>10][density<=15]{
    ::case {
      line-width: 5*@scale;
      line-color: @lightblue;
      line-join: round;
      line-cap: round;      
    }
    ::fill {
      line-width: 2*@scale;
      line-color:@yellow;
      line-join: round;
      line-cap: round;      
    }
  }
  [density>15][density<=20]{
    ::case {
      line-width: 5*@scale;
      line-color: @lightblue;
      line-join: round;
      line-cap: round;      
    }
    ::fill {
      line-width: 3*@scale;
      line-color: @yellow;
      line-join: round;
      line-cap: round;      
    }
    ::line {
      line-width: 1.5*@scale;
      line-color: @red;
      line-join: round;
      line-cap: round;      
    }
  }
  [density>20][density<=30]{
    ::case {
      line-width: 5.5*@scale;
      line-color: @lightblue;
      line-join: round;
      line-cap: round;      
    }
    ::fill {
      line-width: 4*@scale;
      line-color: @yellow;
      line-join: round;
      line-cap: round;      
    }
    ::line {
      line-width: 2*@scale;
      line-color: @red;
      line-join: round;
      line-cap: round;      
    }
  }
    [density>20][density<=30]{
    ::case {
      line-width: 6*@scale;
      line-color: @lightblue;
      line-join: round;
      line-cap: round;      
    }
    ::fill {
      line-width: 4*@scale;
      line-color: @yellow;
      line-join: round;
      line-cap: round;      
    }
    ::line {
      line-width: 2.5*@scale;
      line-color: @red;
      line-join: round;
      line-cap: round;      
    }
  }
  [density>30][density<=50]{
    ::case {
      line-width: 6.5*@scale;
      line-color: @lightblue;
      line-join: round;
      line-cap: round;      
    }
    ::fill {
      line-width: 5*@scale;
      line-color: @yellow;
      line-join: round;
      line-cap: round;      
    }
    ::line {
      line-width: 3*@scale;
      line-color: @red;
      line-join: round;
      line-cap: round;      
    }
  }
  [density>50][density<=100]{
    ::case {
      line-width: 8*@scale;
      line-color: @lightblue;
      line-join: round;
      line-cap: round;      
    }
    ::fill {
      line-width: 7*@scale;
      line-color: @yellow;
      line-join: round;
      line-cap: round;      
    }
    ::line {
      line-width: 3.5*@scale;
      line-color: @red;
      line-join: round;
      line-cap: round;      
    }
  }
  [density>100]{
    ::case {
      line-width: 10.5*@scale;
      line-color: @lightblue;
      line-join: round;
      line-cap: round;      
    }
    ::fill {
      line-width: 8*@scale;
      line-color: @yellow;
      line-join: round;
      line-cap: round;      
    }
    ::line {
      line-width: 5*@scale;
      line-color: @red;
      line-join: round;
      line-cap: round;      
    }
  }
}

```


### Speed 

<img width="671" alt="screen shot 2017-02-10 at 09 28 56" src="https://cloud.githubusercontent.com/assets/7943442/22824642/04a3867a-ef89-11e6-86fd-814b39573815.png">



```css
/***************
SPEED MAP
***************/

// Colours
@color1: #eff3ff;
@color2: #c6dbef;
@color3: #9ecae1;
@color4: #6baed6;
@color5: #3182bd;
@color6: #08519c;

@speed_width: 5; 

#bike::outline[zoom>10]{
  line-width: @speed_width+2;
  line-color: #000000;
  line-join: round;
  line-cap: round;
  line-opacity:0.6;
  ::fill{
   	line-width:@speed_width;
  	line-color:@color2;
    line-join: round;
	line-cap: round;
  }
  
  
}

#bike::blue{
  line-width: @speed_width;
  line-join: round;
  line-cap: round;
  line-color: @color1 ;
  line-opacity: 0.5;
  
  [zoom<11]{
  line-width: 2;}
  
  [avg_speed<=5]{
    line-color: @color1;
  }
  [avg_speed > 5][avg_speed <= 10]{
     line-color: @color2;
  }
  [avg_speed > 10][avg_speed <= 20]{
      line-color: @color3;
  }
  [avg_speed > 20][avg_speed <= 30]{
      line-color: @color4;
  }
  [avg_speed > 30][avg_speed <= 50]{
      line-color: @color5;
  }
  [avg_speed > 50]{
      line-color: @color6;
  }
}

```

