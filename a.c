#include<stdio.h>
#include<fcntl.h>
#define buffersize 10000
int main()
{	
char source[25],destination[25]; 
char buffer[buffersize];
ssize_tread_in,write_out; 
printf("Enter source file name");
scanf("%s",&source);
printf("%s",source);
int sourcefiledesc = open(source);
{
printf("Enter destination file name");
scanf("%s",&destination);
int destfiledesc = open(destination,O_WRONLY | O_CREAT);
while((read_in = read(sourcefiledesc,&buffer,buffersize))>0)
{
write_out = write(destfiledesc,&buffer,read_in);
}
close(sourcefiledesc);
close(destfiledesc);
}
return 0;
}
