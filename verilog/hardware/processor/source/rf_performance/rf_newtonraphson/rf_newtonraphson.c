#include<stdio.h>
#include<math.h>
double F(double x)
{//our function
    return ((x)*(x)-5);
}
double Fd(double x)
{//function's differentiation
    return (2*(x));
}
int main(void)
{
   
    double h,root,x1;
    double x0 = 2;
    double err = 0.0000000001;
    int miter = 7;
    int iter = 1;
   
    while(iter<=miter)
    {
        h=F(x0)/Fd(x0);//calculatinf f(x)/f'(x)as we do in Newton Raphson method
        x1=x0-h;//x1=x0-f(x)/f'(x)
        if(fabs(h)<err)//If the difference between the 2 approximations is below the max error
        {
            root=x1;//then make the approximation as the root
            break;
        }
        else
        x0=x1;
        iter++;
    }
   
    return 0;
    
}
