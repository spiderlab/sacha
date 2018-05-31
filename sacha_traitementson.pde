import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;
int w;
float taille,r,x,y;
float c;
float [] ht = new float[25];
int moyenne,pop;
float angle = 0.0;  
void setup() {
frameRate(25);
  size (900, 800);
  background(0);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft= new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60, 7);
  //stroke (255 );
  w= width/fft.avgSize();
  noFill();
}

void draw()

{
if (keyPressed=true){
if (key=='a'){
    couleur();}}
    if (key=='z'){
    nocouleur();}}





void mousePressed(){
  
  saveFrame("output/image####.png");}
  
  void couleur(){    /////////////////////////////
    noStroke();
colorMode(HSB,300);
//rectMode(RADIUS);
r=360/20;
  // background(0);
  fft.forward(in.mix);
    translate(width/2,height/2);
    beginShape(TRIANGLE_FAN);
    vertex(0,0);
for(int i=0; i<=20; i++){
pushMatrix();
//fill(ht[i],ht[i],300);
fill(197,ht[i],ht[i]);
x=cos(radians(r*i))*ht[i];
y=sin(radians(r*i))*ht[i];
    ht[i]=hauteur(i);
   // println(1,ht[1]);
 println (ht[i], i);
vertex(x,y);
// rotate(radians(r));
// vertex(0,(ht[i])); 
 popMatrix();
 }
//  vertex(0,0);
 endShape(CLOSE);
}
   
int hauteur(int val){
  for(int j=0;j<25; j++){
   moyenne+=int(fft.getBand(j*val)*20);
    }
 val=int(moyenne/25);
  //println(val);
    moyenne=0;
  return val;
    
  }
  
   void nocouleur(){///////////////////////////////////
    stroke(255);
colorMode(HSB,300);
//rectMode(RADIUS);
r=360/20;
  // background(0);
  fft.forward(in.mix);
    translate(width/2,height/2);
    beginShape(TRIANGLE_FAN);
    vertex(0,0);
for(int i=0; i<=20; i++){
pushMatrix();
//fill(ht[i],ht[i],300);
fill(0);
x=cos(radians(r*i))*ht[i];
y=sin(radians(r*i))*ht[i];
    ht[i]=hauteur(i);
   // println(1,ht[1]);
 println (ht[i], i);
vertex(x,y);
// rotate(radians(r));
// vertex(0,(ht[i]));
 
 
  
 popMatrix();
 }
//  vertex(0,0);
 endShape(CLOSE);
}
    
