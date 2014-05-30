library(ggplot2)
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

f_range = c(-60,0)
d_range = c(-5,20)
t_range = c(0,11500)
epoints = c(4500,5100,5550,7800,8900)

#plot graphs with ggplot2
S1_fplot<- ggplot() +
  annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
  annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
  annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
  annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
  annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
  geom_line(data=S1_f, aes(t,f3, col = "3")) +
  geom_line(data=S1_f, aes(t,f5, col = "5")) +
  geom_line(data=S1_f, aes(t,f7, col = "7")) +
  geom_line(data=S1_f, aes(t,f9, col = "9")) +
  geom_line(data=S1_f, aes(t,f11, col = "11")) +
  geom_line(data=S1_f, aes(t,f13, col = "13")) +
  scale_y_continuous('f (Hz)',limits = f_range) + scale_x_continuous("t (s)", limits = t_range) +
  ggtitle("Experiment 1 S1 H4 Binder") +
  labs(colour = "n")
print(S1_fplot)

S2_fplot<- ggplot() +
  annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
  annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
  annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
  annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
  annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
  geom_line(data=S2_f, aes(t,f3, col = "3")) +
  geom_line(data=S2_f, aes(t,f5, col = "5")) +
  geom_line(data=S2_f, aes(t,f7, col = "7")) +
  geom_line(data=S2_f, aes(t,f9, col = "9")) +
  geom_line(data=S2_f, aes(t,f11, col = "11")) +
  geom_line(data=S2_f, aes(t,f13, col = "13")) +
  scale_y_continuous('f (Hz)',limits = f_range) + scale_x_continuous("t (s)", limits = t_range) +
  ggtitle("Experiment 1 S2 Control Binder") +
  labs(colour = "n")
print(S2_fplot)

S3_fplot<- ggplot() +
  annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
  annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
  annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
  annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
  annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
  geom_line(data=S3_f, aes(t,f3, col = "3")) +
  geom_line(data=S3_f, aes(t,f5, col = "5")) +
  geom_line(data=S3_f, aes(t,f7, col = "7")) +
  geom_line(data=S3_f, aes(t,f9, col = "9")) +
  geom_line(data=S3_f, aes(t,f11, col = "11")) +
  geom_line(data=S3_f, aes(t,f13, col = "13")) +
  scale_y_continuous('f (Hz)',limits = f_range) + scale_x_continuous("t (s)", limits = t_range) +
  ggtitle("Experiment 1 S3 D4 Binder") +
  labs(colour = "n")
print(S3_fplot)

S4_fplot<- ggplot() +
  annotate("text", label = "A", x = epoints[1], y = 20, size = 8, colour = "black") +
  annotate("text", label = "B", x = epoints[2], y = 20, size = 8, colour = "black") +
  annotate("text", label = "C", x = epoints[3], y = 20, size = 8, colour = "black") +
  annotate("text", label = "D", x = epoints[4], y = 20, size = 8, colour = "black") +
  annotate("text", label = "E", x = epoints[5], y = 20, size = 8, colour = "black") +
  geom_line(data=S4_f, aes(t,f3, col = "3")) +
  geom_line(data=S4_f, aes(t,f5, col = "5")) +
  geom_line(data=S4_f, aes(t,f7, col = "7")) +
  geom_line(data=S4_f, aes(t,f9, col = "9")) +
  geom_line(data=S4_f, aes(t,f11, col = "11")) +
  geom_line(data=S4_f, aes(t,f13, col = "13")) +
  scale_y_continuous('f (Hz)',limits = c(-30,30)) + scale_x_continuous("t (s)", limits = t_range) +
  ggtitle("Experiment 1 S4 No Binder") +
  labs(colour = "n")
print(S4_fplot)

S1_dplot <- ggplot() +
  annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
  annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
  annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
  annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
  annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
  geom_line(data=S1_d, aes(t,d3, col = "3")) +
  geom_line(data=S1_d, aes(t,d5, col = "5")) +
  geom_line(data=S1_d, aes(t,d7, col = "7")) +
  geom_line(data=S1_d, aes(t,d9, col = "9")) +
  geom_line(data=S1_d, aes(t,d11, col = "11")) +
  geom_line(data=S1_d, aes(t,d13, col = "13")) +
  scale_y_continuous('D x10-6',limits = c(-5,50)) + scale_x_continuous("t (s)", limits = t_range) +
  ggtitle("Experiment 1 S1 H4 Binder") +
  labs(colour = "n")
print(S1_dplot)

S2_dplot <- ggplot() +
  annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
  annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
  annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
  annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
  annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
  geom_line(data=S2_d, aes(t,d3, col = "3")) +
  geom_line(data=S2_d, aes(t,d5, col = "5")) +
  geom_line(data=S2_d, aes(t,d7, col = "7")) +
  geom_line(data=S2_d, aes(t,d9, col = "9")) +
  geom_line(data=S2_d, aes(t,d11, col = "11")) +
  geom_line(data=S2_d, aes(t,d13, col = "13")) +
  scale_y_continuous('D x10-6',limits = d_range) + scale_x_continuous("t (s)", limits = t_range) +
  ggtitle("Experiment 1 S2 Control Binder") +
  labs(colour = "n")
print(S2_dplot)

S3_dplot <- ggplot() +
  annotate("text", label = "A", x = epoints[1], y = 0, size = 8, colour = "black") +
  annotate("text", label = "B", x = epoints[2], y = 0, size = 8, colour = "black") +
  annotate("text", label = "C", x = epoints[3], y = 0, size = 8, colour = "black") +
  annotate("text", label = "D", x = epoints[4], y = 0, size = 8, colour = "black") +
  annotate("text", label = "E", x = epoints[5], y = 0, size = 8, colour = "black") +
  geom_line(data=S3_d, aes(t,d3, col = "3")) +
  geom_line(data=S3_d, aes(t,d5, col = "5")) +
  geom_line(data=S3_d, aes(t,d7, col = "7")) +
  geom_line(data=S3_d, aes(t,d9, col = "9")) +
  geom_line(data=S3_d, aes(t,d11, col = "11")) +
  geom_line(data=S3_d, aes(t,d13, col = "13")) +
  scale_y_continuous('D x10-6',limits = d_range) + scale_x_continuous("t (s)", limits = t_range) +
  ggtitle("Experiment 1 S3 D4 Binder") +
  labs(colour = "n")
print(S3_dplot)

S4_dplot <- ggplot() +
  annotate("text", label = "A", x = epoints[1], y = 5, size = 8, colour = "black") +
  annotate("text", label = "B", x = epoints[2], y = 5, size = 8, colour = "black") +
  annotate("text", label = "C", x = epoints[3], y = 5, size = 8, colour = "black") +
  annotate("text", label = "D", x = epoints[4], y = 5, size = 8, colour = "black") +
  annotate("text", label = "E", x = epoints[5], y = 5, size = 8, colour = "black") +
  geom_line(data=S4_d, aes(t,d3, col = "3")) +
  geom_line(data=S4_d, aes(t,d5, col = "5")) +
  geom_line(data=S4_d, aes(t,d7, col = "7")) +
  geom_line(data=S4_d, aes(t,d9, col = "9")) +
  geom_line(data=S4_d, aes(t,d11, col = "11")) +
  geom_line(data=S4_d, aes(t,d13, col = "13")) +
  scale_y_continuous('D x10-6',limits = d_range) + scale_x_continuous("t (s)", limits = t_range) +
  ggtitle("Experiment 1 S4 No Binder") +
  labs(colour = "n")
print(S4_dplot)
