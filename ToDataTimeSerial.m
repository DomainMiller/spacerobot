%给定阶跃时间间隔
sampleTime = 0.01;
numSteps = 1300;
time = sampleTime*(0:numSteps-1);
time = time';


%关节1数据加时间戳
data = (trecord(1,:))';
linky1 = timeseries(data,time);


data1 = (tvrecord(1,:))';
link11 = timeseries(data1,time);

%关节2数据加时间戳
data2 = (trecord(2,:))';
linky2 = timeseries(data2,time);

data22 = (tvrecord(2,:))';
link22 = timeseries(data22,time);

%关节3数据加时间戳
data3 = (trecord(3,:))';
linky3 = timeseries(data3,time);


data33 = (tvrecord(3,:))';
link33 = timeseries(data33,time);

%关节4数据加时间戳
data4 = (trecord(4,:))';
linky4 = timeseries(data4,time);


data44 = (tvrecord(4,:))';
link44 = timeseries(data44,time);


%关节5数据加时间戳
data5 = (trecord(5,:))';
linky5 = timeseries(data5,time);


data55 = (tvrecord(5,:))';
link55 = timeseries(data55,time);

%关节5数据加时间戳
data6 = (trecord(6,:))';
linky6 = timeseries(data6,time);


data66 = (tvrecord(6,:))';
link66 = timeseries(data66,time);
