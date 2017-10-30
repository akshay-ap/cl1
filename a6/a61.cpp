#include<iostream>
#include<vector>
#include<math.h>
using namespace std;

int main()
{
int n;
cout<<"Enter the number of elements\n";
cin>>n;
double x[n],y[n];
for(int i=0;i<n;i++)
    {
    cin>>x[i]>>y[i];
    }
int clusters;
cout<<"Enter the number of clusters\n";
cin>>clusters;

vector<double>*means;
means=new vector<double>[2];

cout<<"enter cluster means"<<endl;
		for(int i=0;i<clusters;i++)
		{
			int meanx,meany;			
			cin>>meanx>>meany;
			means[0].push_back(meanx);
			means[1].push_back(meany);			
		}

vector<double> *prev_means;
prev_means=new vector<double>[2];

vector<int> *cluster_items;
cluster_items=new vector<int>[n];

int redo=1;
    while(redo!=0)
    {
prev_means[0]=means[0];
prev_means[1]=means[1];

    for(int i=0;i<clusters;i++)
    {
    cluster_items[i].erase(clusteritems[i].begin(),clusteritems[i].end());
    
    }

    for(int i=0;i<n;i++)
    {
    double temp,min=99999999;
    int pos=0;
        for(int i=0;i<clusters;i++)
        {
         temp=sqrt(pow((x[i]-means[0][j]),2)+pow((y[i]-means[0][j]),2));
            if(min>temp)
            {
            min=temp;
            pos=j;
            }
        }
        cluster_items[pos].push_back(i);

    
    }
    redo++;
    }

return 0;
}
