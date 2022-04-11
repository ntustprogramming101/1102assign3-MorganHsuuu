final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
final int hogWidth=80,cabbageWidth=80,soldierWidth=80;
float cabbage_X = floor(random(0,8));
float cabbage_Y = floor(random(2,6));
int soldierPosition;
float soldierWalk;
float groundhog_X =320 , groundhog_Y=80;
float groundhog_X1 =320 , groundhog_Y1=80;
int lifes = 2;
PImage groundhogIdle,groundhogDown,groundhogLeft,groundhogRight,cabbage,soldier;
PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered,life;
PImage bg, soil0, soil1, soil2, soil3, soil4, soil5;
PImage stone1,stone2;
// For debug function; DO NOT edit or remove this!
//int playerHealth = 0;
float why = 0;
boolean debugMode = false;
boolean upPressed = false;
boolean downPressed = false;
boolean ca_downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean typeAgain = true;
boolean ca_typeAgain = true;
boolean move = false;
boolean  ca_Situation = false ;
int upTimes=0;  //test derection
int downTimes=0;
int leftTimes=0;
int rightTimes=0;
int ca_downTimes=0;
int countdown;
void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	groundhogIdle= loadImage("img/groundhogIdle.png");
  groundhogDown= loadImage("img/groundhogDown.png");
  groundhogLeft= loadImage("img/groundhogLeft.png");
  groundhogRight= loadImage("img/groundhogRight.png");
  cabbage = loadImage("img/cabbage.png");
  soldier= loadImage("img/soldier.png");
  bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
  life = loadImage("img/life.png");
	soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  soldierPosition=floor(random(2,6));
  soldierWalk=0;
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, why);
     
      
    }
    /* ------ End of Debug Function ------ */
//println(debugMode);
    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game
// Background
    image(bg, 0, 0);

    // Sun
      stroke(255,255,0);
      strokeWeight(5);
      fill(253,184,19);
      ellipse(590,50,120,120);
      
    //soldier
  image(soldier,soldierWalk,soldierPosition*80);
   if(soldierWalk>630){
     soldierWalk=-50;
     }
     else {
     soldierWalk+=3;
     }
    //cabbage 
      if(ca_Situation == true){ 
     image(cabbage,-100,-100);
     cabbage_X=-100;
     cabbage_Y=-100;
     
     //println(lifes);
     
   }else{
    image(cabbage,cabbage_X*80,cabbage_Y*80);

   }
    if (move) {
      pushMatrix();
      translate(0, why); 
    }
		

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
  for(int i=0 ; i<1280 ; i+=80){
    
     for(int j=0 ; j<80*24 ; j+=80){    // 1-4
       if(j<80*4){
         image(soil0, i, 160+j);
           if(i == j){
           image(stone1, i, 160+j);
          }
        }
        
        else if(j>=80*4 && j<80*8){     // 5-8
         image(soil1, i, 160+j); 
           if(i == j){
             image(stone1, i, 160+j);
            }
        }
        else if(j>=80*8 && j<80*12){    // 9-12
         image(soil2, i, 160+j);
           if(j/80%4 == 0){
               if(i/80%4 == 1){
                image(stone1, i, 160+j);
               }
                if(i/80%4 == 2){
                image(stone1, i, 160+j);
               }             
           } 
           else if(j/80%4 == 1){
               if(i/80%4 == 0){
                image(stone1, i, 160+j);
               }
               if(i/80%4 == 3){
                image(stone1, i, 160+j);
               }             
           }  
           else if(j/80%4 == 2){
             if(i/80%4 == 0){
              image(stone1, i, 160+j);
             }
             if(i/80%4 == 3){
              image(stone1, i, 160+j);
             }             
           }
           else if(j/80%4 == 3){
             if(i/80%4 == 1){
              image(stone1, i, 160+j);
             }
                if(i/80%4 == 2){
                image(stone1, i, 160+j);
               }             
           } 
        }
        else if(j>=80*12 && j<80*16){   // 12-16
         image(soil3, i, 160+j);
         if(j/80%4 == 0){
               if(i/80%4 == 1){
                image(stone1, i, 160+j);
               }
                if(i/80%4 == 2){
                image(stone1, i, 160+j);
               }             
           } 
           else if(j/80%4 == 1){
               if(i/80%4 == 0){
                image(stone1, i, 160+j);
               }
               if(i/80%4 == 3){
                image(stone1, i, 160+j);
               }             
           }  
           else if(j/80%4 == 2){
             if(i/80%4 == 0){
              image(stone1, i, 160+j);
             }
             if(i/80%4 == 3){
              image(stone1, i, 160+j);
             }             
           }
           else if(j/80%4 == 3){
             if(i/80%4 == 1){
              image(stone1, i, 160+j);
             }
                if(i/80%4 == 2){
                image(stone1, i, 160+j);
               }             
           } 
        }
        else if(j>=80*16 && j<80*20){   // 17-20
         image(soil4, i, 160+j);
           if(i/80%3 == 1){
           image(stone1, i-(j-80*16), 160+j);
           
           } 
             else if(i/80%3 == 2){
             image(stone1, i-(j-80*16), 160+j);
             image(stone2, i-(j-80*16), 160+j);
             }
        
        }
        else if(j>=80*20 && j<80*24){   // 21-24
         image(soil5, i, 160+j);
          if(i/80%3 == 1){
           image(stone1, i-(j-80*16), 160+j);
           
           } 
             else if(i/80%3 == 2){
             image(stone1, i-(j-80*16), 160+j);
             image(stone2, i-(j-80*16), 160+j);
             }
        }
     } 
   
    }
		

		// Player
 if(groundhog_Y<=hogWidth){
        groundhog_Y=hogWidth;
        } 
 if(groundhog_X>=width-hogWidth){
        groundhog_X=width-hogWidth;  
  }
 if(groundhog_X<0){
    groundhog_X=0;
   }
   if(groundhog_Y>80*25){
    groundhog_Y=80*25;
   }

       
//hog -- set counter
 
  if(downTimes == 0 && rightTimes == 0 && leftTimes ==0){
    image(groundhogIdle,groundhog_X,groundhog_Y);
    if(typeAgain == false){
       if(downPressed == true){
           downTimes = 15;
           ca_downTimes = 15;
          }
      else if(rightPressed == true){
          rightTimes = 15;
          }  
      else if(leftPressed == true){
          leftTimes = 15;
          }
  }
}
else {
  //Move according to counter
  if(downTimes > 0){
    if(groundhog_Y<=80*25){////////////////////
    groundhog_Y += 16.0/3;
    //println("ground"+groundhog_Y);
  }
     downTimes--;
     if(downTimes == 1 ){
       typeAgain = true;      
       if(downPressed == true){
        downTimes += 15;
       }
       
     }
     if(ca_downTimes > 0){
     if(why >= -80*20){
        why -= 16.0/3;       /////////////////////////////
    }  
     ca_downTimes--;
           if(ca_downTimes == 1 ){
             ca_typeAgain = true;      
               if(ca_downPressed == true){
                ca_downTimes += 15;
               }
           }
      
          
        }
      //println("downTimes"+downTimes);
      //println("down X Y"+groundhog_X,groundhog_Y);
     image(groundhogDown,round(groundhog_X),round(groundhog_Y));
     
     //println("down  "+downTimes);
     //println("down  "+groundhog_X,groundhog_Y);
   }
           
       
      
 if(rightTimes > 0){
    //println(rightTimes);
    groundhog_X+= 16.0/3;
    rightTimes--;
     //if(rightTimes==0){
     //groundhog_X=(groundhog_X+80)/80*80;
     //}
    if(rightTimes == 1 ){
     typeAgain = true;
     if(rightPressed == true){
        rightTimes += 15;
       }
     }
      //println("right  "+groundhog_X,groundhog_Y);
     image(groundhogRight,round(groundhog_X),round(groundhog_Y));  
   }  
       
       
     //press left  
       

  if(leftTimes > 0){
     groundhog_X -= 16.0/3 ;
     leftTimes--;
     //if(leftTimes==0){
     //groundhog_X=(groundhog_X)/80*80;
     //}
     if(leftTimes == 1 ){
     typeAgain = true;
     if(leftPressed == true){
        leftTimes += 15;
       }
     }
     
     image(groundhogLeft,(groundhog_X),(groundhog_Y)); 
     //println("left  "+leftTimes);
     //println("left  "+groundhog_X,groundhog_Y);
   }    
   
}
		
      if (move) {
        translate(0,why);
        popMatrix();
     }
     // Health UI
    for(int i = 0; i<lifes; i++){
     
      image(life,10+i*70,10); 
    }
    if(lifes == 0){
      gameState = GAME_OVER;
      }
		break;

		case GAME_OVER: // Gameover Screen
    why = 0;
    groundhog_X=320;
    groundhog_Y=80;
		image(gameover, 0, 0);
		lifes=2;
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
    
		break;
		
	}



    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
 switch(keyCode){
      case UP:
      move = true;
      upPressed = true ;
      typeAgain = false ;
      //if(cameraOffsetY < 0){
      //   cameraOffsetY += 80;
      //   println("UP"+cameraOffsetY);
      //}      
      break;

      case DOWN:
      move = true;
      downPressed = true;
      typeAgain = false ;
      ca_typeAgain = false ;
      ca_downPressed = true;
     // println("Down"+cameraOffsetY);
      break;
      case LEFT:
          leftPressed = true;
          typeAgain = false ;
        break;
         
      case RIGHT:
          rightPressed = true;
          typeAgain = false ;      
        break;    
    }

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      why += 25;
      break;

      case 's':
      debugMode = true;
      why -= 25;
      break;

      case 'a':
      if(lifes > 0) lifes --;
      break;

      case 'd':
      if(lifes < 5) lifes ++;
      break;
    }
}

void keyReleased(){
   ca_downPressed = false; 
   downPressed = false;
   leftPressed = false;
   rightPressed = false;
}
