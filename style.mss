

/*
Map {
  //background-color: @gray;
  //buffer-size: 256;
}

#countries {
  ::outline {
    line-color: #85c5d3;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #fff;
}
*/

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



/***************
SPEED MAP
***************/

// Colours
/*
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

*/