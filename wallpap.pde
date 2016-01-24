PImage buffer;

int bw=1920;
int bh=1080;

void setup()
{
    size(768,512);
    buffer=createImage(768,512,RGB);

    frameRate(30);
    noiseSeed(0);
}

void draw()
{
    render(buffer);
    image(buffer,0,0,768,512);
}

void mouseClicked()
{
    PImage large=createImage(bw,bh,RGB);
    render(large);
    large.save("image.bmp");
}

void render(PImage img)
{
   final int w=img.width;
   final int h=img.height;
   final float[][] k={{1,3},
                      {4,2}};

    for (int i=0;i<w*h;i++)
    {
        int x=i%w;
        int y=i/w;
        float xx=float(x)/float(w);
        float yy=float(y)/float(h);
        float ii=intensity(xx,yy,i);
            
        if (ii<0.f)  ii=abs(ii);
        if (ii>1.f)  ii=1.f;
        
        // 16 colors
        /*
        int v=16*(int(16*ii))+
        16*int( ((16.*(ii%(1./16.)))+k[x%2][y%2])>=1?1:0  );
        */
        
        // 256
        /*
        ii=ii+
        1./256.*(((256.*(ii%(1./256.)))+k[x%2][y%2]/5.)>=1?1:0);
        */
        int g=dither(x,y,ii,32,32);
        int b=dither(x,y,ii,40,92);
         
        
        //color c=color(0,32+32*ii,92+40*ii); //<>//
        color c=color(0,g,b);
        //color c=color(v);
        img.pixels[i]=c;
    }
    img.updatePixels();
}

//v=number of values
int dither(int x,int y,float i,float v,int off)
{
    final float[][] k={{1,3},
                       {4,2}};
                              
    return off+(int(i*v))+
        int( ((v*(i%(1./v)))+k[x%2][y%2]/4.)>=1?1:0  );
}