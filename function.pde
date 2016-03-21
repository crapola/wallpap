float intensity(float x,float y,int i)
{
    float s=0.1f;
    PVector m,p,a,b,c,n,l;
    float mx=mouseX/768.f;
    float my=mouseY/512.f;
    m=new PVector(mx,my,my*2);
    p=new PVector(x,y,0);
    a=new PVector(0.5,0.5,0.5);

    float d=0.100001f;
    float sy=surf(x,y-d);
    float sx=surf(x+d,y);
    
    PVector ba=new PVector(0,y-d,sy);
    PVector bb=new PVector(x+d,0,sx);
    n=bb.cross(ba).normalize();
    l=PVector.sub(a,m);
    return n.dot(l) *y;
}

float surf(float x,float y)
{
    return cos(1+y*6+sin(0+x*6));
}