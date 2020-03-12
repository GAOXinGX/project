#occupationalStatus

##I
#查看数据集的大小和结构，维度、名称、属性。
dim(occupationalStatus)
names(occupationalStatus)
str(occupationalStatus)
attributes(occupationalStatus)

#查看数据集的前几行和后几行
occupationalStatus[1:5,]
head(occupationalStatus)
tail(occupationalStatus)
occupationalStatus[1:8,]

#用summary()看数据的分布情况
summary(occupationalStatus)

#看平均值、中位数、极差，四分位数和百分位数
mean(occupationalStatus)
median(occupationalStatus)
range(occupationalStatus)
quantile(occupationalStatus)
min(occupationalStatus)
max(occupationalStatus)

#查看方差，计算密度估计值
var(occupationalStatus)
density.default(occupationalStatus)

##II
#饼图（对于因子，可以先算频数，然后画饼图或条形图）
table(occupationalStatus)
pie(table(occupationalStatus))
#条形图
barplot(table(occupationalStatus))
#克利夫兰点图
dotchart(table(occupationalStatus))
#绘制直方图
hist(occupationalStatus)
#马赛克图
mosaicplot(occupationalStatus)

#??What is the diffrence between these two commands ? Comment your results.
#plot图 （就是马赛克图）
plot(occupationalStatus)
#sunflowerplot() 函数
sunflowerplot(occupationalStatus)

#III回归模型的评估
#拟合统一的关联模型，将对角线效果分开  Fit a uniform association model separating diagonal effects
#残差与拟合（https://blog.csdn.net/qq_35837578/article/details/88357551）
#（Residuals vs Fitted）普通残差与拟合值的残差图：这是残差与真实值之间的关系画图
#（Normal Q-Q plot）正态QQ的残差图：用来检测其残差是否是正态分布的
#（Scale-Location plot）标准化残差的开方与拟合值的残差图：这个图是用来检查等方差假设的
#（Residuals vs Leverage）残差与杠杆：这种图的意义在于检查数据分析项目中是否有特别极端的点
Diag <- as.factor(diag(1:8))
Rscore <- scale(as.numeric(row(occupationalStatus)), scale = FALSE)
Cscore <- scale(as.numeric(col(occupationalStatus)), scale = FALSE)
modUnif <- glm(Freq ~ origin + destination + Diag + Rscore:Cscore,
               family = poisson, data = occupationalStatus)

summary(modUnif)
plot(modUnif) 
# 4 plots, with warning about  h_ii ~= 1

