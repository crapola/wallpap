float intensity(float x,float y,int i)
{
    float s=0.1f;
    PVector m,p,a,n,l;
    float mx=mouseX/768.f;
    float my=mouseY/512.f;
    m=new PVector(mx,my,0.25);
    p=new PVector(x,y,0.0);
    a=new PVector(0.5,0.5,0.0);

    float d=0.0125;

    PVector top=new PVector(x,y,surf(x,y));
    PVector dx=new PVector(x+d,y,surf(x+d,y));
    PVector dy=new PVector(x,y+d,surf(x,y+d));
    
    dx=PVector.sub(dx,top);
    dy=PVector.sub(dy,top);

    n=dx.cross(dy).normalize();
    
    l=PVector.sub(m,top).normalize();
    return PVector.sub(m,p).mag()*n.dot(l);
}

float surf(float x,float y)
{
     return sin(0.2+y)*cos(y+sin(5*(x/(0.2+y))));
   // return noise(x*10,y*10);
}

/*
  Something different: try this harmonograph:
  
  loop:
      x=sin(a*y)+cos(b*x)-cos(c*z)
      y=sin(d*x)+cos(e*y)-cos(f*z)
      z+=0.1
      plot x,y,z,white
*/