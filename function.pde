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
 return cos(3.0*x*cos(3.0*y*sin(x)));
   // return noise(x*10,y*10);
}