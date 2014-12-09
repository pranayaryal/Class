## created new variable diff which is difference between fhi.post and fhi.pre



##Is the mean (or median) FHI score in this population different than 6, 
## a commonly held threshold for minimally healthy eating habits (variable fhi.pre)?
## Checking for normality on fhi.pre

with(fhi,shapiro.test(fhi.pre))
## it is not normal, so we go ahead with Wilcox rank sum test
with(fhi,wilcox.test(fhi.pre,alternative="two.sided",mu=6))
## answer is that null hypothesis is accepted which means there is no difference

##If individuals in this population are provided with information on 
##healthy eating habits, does this increase mean (or median) 
##FHI scores in this population (variables fhi.pre and fhi.post)?

##pairted t sample test

## testing variance in pre and post
var.test(fhi$fhi.pre,fhi$fhi.post)

##checking whether diff is normally distributed(it is)
## hence t statistics can be used
with(fhi,shapiro.test(diff))

##checking whether pre and post is normally distributed(pre is not, post is normally dis)
## so will have to run the wilcox rank s of median
with(fhi,shapiro.test(fhi.pre))
with(fhi,shapiro.test(fhi.post))

## calcluating standard deviations separately in pre and post
sd1<-sd(fhi$fhi.pre)
sd2<-sd(fhi$fhi.post)
##calculating pooled standard deviation
sp <-(28*(sd1^2)+28*(sd2^2))/56
## calculating tscore for differnce in mean of pre and post for equal variance
ts <-(mean(fhi$fhi.post)-mean(fhi$fhi.pre))/sqrt(sp*(58/(29*29)))
##tquantile for 56(n1+n2-2)degrees of freedom
qt(0.95,56)
## since ts is greater than qt, null hypothesis is rejected which means means are not equal


