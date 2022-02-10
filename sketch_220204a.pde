float rotX, rotY;
float l1 = 200, l2 = 300, l3 = 200;
float theta1, theta2, theta3;
float x1, x2, x3;
float Px = 1000, Py = 1000, Pz = 1000;
float a1 = 1, a2 = 1;

void setup(){
  size(1300, 1000, P3D);
}

void draw(){
   background(0);
   smooth();
   lights();
   directionalLight(50, 100, 125, 1, 0, 0);
   noStroke(); 
   
   translate(width/2, height*5/7, 0);
   fill(204);
   rotateX(rotX);
   rotateY(-rotY);
   box(100, 30, 100);
   
   pushMatrix();
   translate(width/4, 40, 200);
   box(400, 10, 400);
   
   translate(-width*2/4, 0, 0);
   box(400, 10, 400);
   
   translate(width/4, 0, -width*3/7);
   box(400, 10, 400);
   popMatrix();
   
   translate(0, -100, 0);
   rotateY(x1);
   x1 += theta1/70;
   if (keyPressed){
     if (key == 'k'){
       x1 += theta1/20;
     }
   }
   box(50, -l1, 50);
    
   translate(0, -100, 0);
   rotateX(x2);
   pushMatrix();
     x2 += theta2/150 * a1;
   if ((x2 > PI/2)||(x2 < 0)) {
     a1 = -a1;
    } 
   popMatrix();
   if (keyPressed){
     if (key == 's'){
       x2 += theta2/50;
     }
      if (key == 't'){
       x2 -= theta2/50;
     }
   }
   sphere(18);
   
   translate(0, -150, 0);
   box(30, -l2, 30);
      
   translate(0, -150, 0);
   rotateX(x3);
   pushMatrix();
   x3 += theta3/95 * a2;
   if ((x3 > PI/2)||(x3 < 0)) {
     a2 = -a2;
    } 
   popMatrix();
   if (keyPressed){
     if (key == 'm'){
       x3 += theta3/40;
     }
      if (key == 'n'){
       x3 -= theta3/40;
     }
   }
   sphere(12);
      
   translate(0, -100, 0);
   box(20, -l3, 20);   
   
   translate(0, -100, 0);
   pushMatrix();
   box(45, 10, 25);
   
   translate(-17, -15, 0);
   box(10, 30, 25);
   
   translate(34, 0, 0);
   box(10, 30, 25);
   popMatrix();   

   float x3 = PI/4,
         C3 = cos(x3),
         S3 = sin(x3),
         A = sqrt(l1*l1+l2*l2),
         B = l3 - l1,
         M = l2 + l3*C3,
         N = l3*S3 ;
           
         theta1 = atan2(Py, Px); 
         theta2 = atan2(M*A-N*B, N*A+M*B);
         theta3 = atan2(sqrt(1-C3*C3), C3);
}
 
void mouseDragged(){
    rotY -= (mouseX - pmouseX) * 0.01;
    rotX -= (mouseY - pmouseY) * 0.01;
}
