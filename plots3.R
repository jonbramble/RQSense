library(ggplot2)
source("/home/jon/Programming/R/qcmd/multiplot.R")
# load the data from text file
MIP_A <- read.delim("/data/phyjpb/Data/QCMD/02.05.14/02-05-14-MIPs.txt")

theme_white <- function() {
  theme_update(panel.background = element_blank(),
               panel.grid.major = element_blank())
}

theme_set(theme_bw(base_size = 20))
theme_white()

#put data into data frames for f and d for each sensor
S1_f <- data.frame(MIP_A$Time_1,MIP_A$F_1.3,MIP_A$F_1.5,MIP_A$F_1.7,MIP_A$F_1.9,MIP_A$F_1.11,MIP_A$F_1.13)
colnames(S1_f) <- c('t','f3','f5','f7','f9','f11','f13')

S2_f <- data.frame(MIP_A$Time_1,MIP_A$F_2.3,MIP_A$F_2.5,MIP_A$F_2.7,MIP_A$F_2.9,MIP_A$F_2.11,MIP_A$F_2.13)
colnames(S2_f) <- c('t','f3','f5','f7','f9','f11','f13')

S3_f <- data.frame(MIP_A$Time_1,MIP_A$F_3.3,MIP_A$F_3.5,MIP_A$F_3.7,MIP_A$F_3.9,MIP_A$F_3.11,MIP_A$F_3.13)
colnames(S3_f) <- c('t','f3','f5','f7','f9','f11','f13')

S4_f <- data.frame(MIP_A$Time_1,MIP_A$F_4.3,MIP_A$F_4.5,MIP_A$F_4.7,MIP_A$F_4.9,MIP_A$F_4.11,MIP_A$F_4.13)
colnames(S4_f) <- c('t','f3','f5','f7','f9','f11','f13')

S1_d <- data.frame(MIP_A$Time_1,MIP_A$D_1.3,MIP_A$D_1.5,MIP_A$D_1.7,MIP_A$D_1.9,MIP_A$D_1.11,MIP_A$D_1.13)
colnames(S1_d) <- c('t','d3','d5','d7','d9','d11','d13')

S2_d <- data.frame(MIP_A$Time_1,MIP_A$D_2.3,MIP_A$D_2.5,MIP_A$D_2.7,MIP_A$D_2.9,MIP_A$D_2.11,MIP_A$D_2.13)
colnames(S2_d) <- c('t','d3','d5','d7','d9','d11','d13')

S3_d <- data.frame(MIP_A$Time_1,MIP_A$D_3.3,MIP_A$D_3.5,MIP_A$D_3.7,MIP_A$D_3.9,MIP_A$D_3.11,MIP_A$D_3.13)
colnames(S3_d) <- c('t','d3','d5','d7','d9','d11','d13')

S4_d <- data.frame(MIP_A$Time_1,MIP_A$D_4.3,MIP_A$D_4.5,MIP_A$D_4.7,MIP_A$D_4.9,MIP_A$D_4.11,MIP_A$D_4.13)
colnames(S4_d) <- c('t','d3','d5','d7','d9','d11','d13')

f_range = c(-40,0)
d_range = c(-5,20)
t_range = c(0,11500)
epoints = c(1700,5555,6560,7800,8900)

f5_1 <- data.frame(S1_f$t)
f5_1$S1 <- S1_f$f5
f5_1$sensor <- "S1"
colnames(f5_1)=c('t','frequency','sensor')

f5_2 <- data.frame(S2_f$t)
f5_2$S2 <- S2_f$f5
f5_2$sensor <- "S2"
colnames(f5_2)=c('t','frequency','sensor')

f5_3 <- data.frame(S3_f$t)
f5_3$S3 <- S3_f$f5
f5_3$sensor <- "S3"
colnames(f5_3)=c('t','frequency','sensor')

f5_4 <- data.frame(S4_f$t)
f5_4$S4 <- S4_f$f5
f5_4$sensor <- "S4"
colnames(f5_4)=c('t','frequency','sensor')

a <- rbind(f5_1,f5_2)
b <- rbind(f5_3,f5_4)
c <- rbind(a,b)


ylab = expression(paste(Delta,"f /Hz"))

fplot <- ggplot(c,aes(x=t,y=frequency,group=sensor,color=sensor)) + scale_x_continuous(limits = t_range) + geom_vline(xintercept = epoints, linetype = "longdash")
fplot + geom_line() +xlab("time /s") + ylab(ylab) + scale_color_discrete(name="Sensor",breaks=c("S1", "S3", "S2", "S4"),labels=c("MIA-1", "MIA-2", "Control Adhiron", "No Adhiron")) +
   annotate("text", label = "A", x = epoints[1]+250, y = 8, size = 6, colour = "black") +
   annotate("text", label = "B", x = epoints[2]+250, y = 8, size = 6, colour = "black") +
   annotate("text", label = "C", x = epoints[3]+250, y = 8, size = 6, colour = "black") +
   annotate("text", label = "D", x = epoints[4]+250, y = 8, size = 6, colour = "black") +
   annotate("text", label = "E", x = epoints[5]+250, y = 8, size = 6, colour = "black")


#S1_fplot<- ggplot() + geom_line(data=S1_f, aes(t,f5, col = "5")) + scale_y_continuous(limits = f_range) + scale_x_continuous(limits = t_range) + theme(legend.position = "none") 
#S2_fplot<- ggplot() + geom_line(data=S2_f, aes(t,f5, col = "5")) + scale_y_continuous(limits = f_range) + scale_x_continuous(limits = t_range) + theme(legend.position = "none")
#S3_fplot<- ggplot() + geom_line(data=S3_f, aes(t,f5, col = "5")) + scale_y_continuous(limits = f_range) + scale_x_continuous(limits = t_range) + theme(legend.position = "none")
#S4_fplot<- ggplot() + geom_line(data=S4_f, aes(t,f5, col = "5")) + scale_y_continuous('f (Hz)',limits = f_range) + scale_x_continuous("t (s)", limits = t_range) + theme(legend.position = "none")
#multiplot(S1_fplot,S2_fplot,S3_fplot,S4_fplot)

#S1_fplot<- ggplot() + 
  #geom_line(data=S1_f, aes(t,f5)) +
  #geom_line(data=S2_f, aes(t,f5)) +
  #geom_line(data=S3_f, aes(t,f5)) +
  #geom_line(data=S4_f, aes(t,f5)) #+
  #scale_y_continuous(limits = f_range) + scale_x_continuous(limits = t_range) + theme(legend.position = "none") 

#print(S1_fplot)


# #plot graphs with ggplot2
# S1_fplot<- ggplot() +
#   annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
#   geom_line(data=S1_f, aes(t,f3, col = "3")) +
#   geom_line(data=S1_f, aes(t,f5, col = "5")) +
#   geom_line(data=S1_f, aes(t,f7, col = "7")) +
#   geom_line(data=S1_f, aes(t,f9, col = "9")) +
#   geom_line(data=S1_f, aes(t,f11, col = "11")) +
#   geom_line(data=S1_f, aes(t,f13, col = "13")) +
#   scale_y_continuous('f (Hz)',limits = f_range) + scale_x_continuous("t (s)", limits = t_range) +
#   ggtitle("Experiment 1 S1 H4 Binder") +
#   labs(colour = "n")
# print(S1_fplot)
# 
# S2_fplot<- ggplot() +
#   annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
#   geom_line(data=S2_f, aes(t,f3, col = "3")) +
#   geom_line(data=S2_f, aes(t,f5, col = "5")) +
#   geom_line(data=S2_f, aes(t,f7, col = "7")) +
#   geom_line(data=S2_f, aes(t,f9, col = "9")) +
#   geom_line(data=S2_f, aes(t,f11, col = "11")) +
#   geom_line(data=S2_f, aes(t,f13, col = "13")) +
#   scale_y_continuous('f (Hz)',limits = f_range) + scale_x_continuous("t (s)", limits = t_range) +
#   ggtitle("Experiment 1 S2 Control Binder") +
#   labs(colour = "n")
# print(S2_fplot)
# 
# S3_fplot<- ggplot() +
#   annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
#   geom_line(data=S3_f, aes(t,f3, col = "3")) +
#   geom_line(data=S3_f, aes(t,f5, col = "5")) +
#   geom_line(data=S3_f, aes(t,f7, col = "7")) +
#   geom_line(data=S3_f, aes(t,f9, col = "9")) +
#   geom_line(data=S3_f, aes(t,f11, col = "11")) +
#   geom_line(data=S3_f, aes(t,f13, col = "13")) +
#   scale_y_continuous('f (Hz)',limits = f_range) + scale_x_continuous("t (s)", limits = t_range) +
#   ggtitle("Experiment 1 S3 D4 Binder") +
#   labs(colour = "n")
# print(S3_fplot)
# 
# S4_fplot<- ggplot() +
#   annotate("text", label = "A", x = epoints[1], y = 20, size = 8, colour = "black") +
#   annotate("text", label = "B", x = epoints[2], y = 20, size = 8, colour = "black") +
#   annotate("text", label = "C", x = epoints[3], y = 20, size = 8, colour = "black") +
#   annotate("text", label = "D", x = epoints[4], y = 20, size = 8, colour = "black") +
#   annotate("text", label = "E", x = epoints[5], y = 20, size = 8, colour = "black") +
#   geom_line(data=S4_f, aes(t,f3, col = "3")) +
#   geom_line(data=S4_f, aes(t,f5, col = "5")) +
#   geom_line(data=S4_f, aes(t,f7, col = "7")) +
#   geom_line(data=S4_f, aes(t,f9, col = "9")) +
#   geom_line(data=S4_f, aes(t,f11, col = "11")) +
#   geom_line(data=S4_f, aes(t,f13, col = "13")) +
#   scale_y_continuous('f (Hz)',limits = c(-30,30)) + scale_x_continuous("t (s)", limits = t_range) +
#   ggtitle("Experiment 1 S4 No Binder") +
#   labs(colour = "n")
# print(S4_fplot)
# 
# S1_dplot <- ggplot() +
#   annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
#   geom_line(data=S1_d, aes(t,d3, col = "3")) +
#   geom_line(data=S1_d, aes(t,d5, col = "5")) +
#   geom_line(data=S1_d, aes(t,d7, col = "7")) +
#   geom_line(data=S1_d, aes(t,d9, col = "9")) +
#   geom_line(data=S1_d, aes(t,d11, col = "11")) +
#   geom_line(data=S1_d, aes(t,d13, col = "13")) +
#   scale_y_continuous('D x10-6',limits = c(-5,50)) + scale_x_continuous("t (s)", limits = t_range) +
#   ggtitle("Experiment 1 S1 H4 Binder") +
#   labs(colour = "n")
# print(S1_dplot)
# 
# S2_dplot <- ggplot() +
#   annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
#   geom_line(data=S2_d, aes(t,d3, col = "3")) +
#   geom_line(data=S2_d, aes(t,d5, col = "5")) +
#   geom_line(data=S2_d, aes(t,d7, col = "7")) +
#   geom_line(data=S2_d, aes(t,d9, col = "9")) +
#   geom_line(data=S2_d, aes(t,d11, col = "11")) +
#   geom_line(data=S2_d, aes(t,d13, col = "13")) +
#   scale_y_continuous('D x10-6',limits = d_range) + scale_x_continuous("t (s)", limits = t_range) +
#   ggtitle("Experiment 1 S2 Control Binder") +
#   labs(colour = "n")
# print(S2_dplot)
# 
# S3_dplot <- ggplot() +
#   annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
#   annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
#   geom_line(data=S3_d, aes(t,d3, col = "3")) +
#   geom_line(data=S3_d, aes(t,d5, col = "5")) +
#   geom_line(data=S3_d, aes(t,d7, col = "7")) +
#   geom_line(data=S3_d, aes(t,d9, col = "9")) +
#   geom_line(data=S3_d, aes(t,d11, col = "11")) +
#   geom_line(data=S3_d, aes(t,d13, col = "13")) +
#   scale_y_continuous('D x10-6',limits = d_range) + scale_x_continuous("t (s)", limits = t_range) +
#   ggtitle("Experiment 1 S3 D4 Binder") +
#   labs(colour = "n")
# print(S3_dplot)
# 
# S4_dplot <- ggplot() +
#   annotate("text", label = "A", x = epoints[1], y = 5, size = 8, colour = "black") +
#   annotate("text", label = "B", x = epoints[2], y = 5, size = 8, colour = "black") +
#   annotate("text", label = "C", x = epoints[3], y = 5, size = 8, colour = "black") +
#   annotate("text", label = "D", x = epoints[4], y = 5, size = 8, colour = "black") +
#   annotate("text", label = "E", x = epoints[5], y = 5, size = 8, colour = "black") +
#   geom_line(data=S4_d, aes(t,d3, col = "3")) +
#   geom_line(data=S4_d, aes(t,d5, col = "5")) +
#   geom_line(data=S4_d, aes(t,d7, col = "7")) +
#   geom_line(data=S4_d, aes(t,d9, col = "9")) +
#   geom_line(data=S4_d, aes(t,d11, col = "11")) +
#   geom_line(data=S4_d, aes(t,d13, col = "13")) +
#   scale_y_continuous('D x10-6',limits = d_range) + scale_x_continuous("t (s)", limits = t_range) +
#   ggtitle("Experiment 1 S4 No Binder") +
#   labs(colour = "n")
# print(S4_dplot)