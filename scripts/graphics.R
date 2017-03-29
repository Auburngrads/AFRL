## ------------------------------------------------------------------------
x <- seq(0, 2 * pi, length.out = 50)
y <- sin(x)

plot(x = x, y = y)

## ------------------------------------------------------------------------
x <- seq(0, 2 * pi, length.out = 50)
y <- sin(x)
plot(x = x, 
     y = y,
     xlim = c(0, 2*pi),
     ylim = c(-1, 1),
     type = 'p', 
     main = 'Title',
     sub = 'Subtitle',
     xlab = 'x-axis label',
     ylab = 'y-axis label',
     xaxt = 's',            # show 's' or not-show 'n' x-axis
     yaxt = 's',            # show 's' or not-show 'n' y-axis
     axes = TRUE,           # show axes?
     ann = TRUE,            # show plot annotations?
     pch = 1,               # Sets the type of plot character
     col = 1,               # Change the color of plotted objects
     cex = 1,               # Enlarge size of plotted objects
     cex.axis = 1,          # Enlarge axis values
     cex.lab = 1,           # Enlarge axis labels
     cex.main = 1.3,        # Enlarge plot title
     col.axis = 1,          # Color axis values
     col.lab = 'red',       # Color axis labels
     col.main = '#d3d3d3',  # Color plot title
     las = 0)               # Rotate axis values 0,1,2,3

## ---- fig.align='center', fig.height=8, fig.width=8, echo=FALSE----------
type <- c('p     (points)',
          'l     (line)',
          'b     (both)',
          'c     (cutout)',
          'o     (overplotted)',
          's     (step over-then-up)',
          'S     (step2 up-then-over)',
          'h     (high density)')
par(mfrow = c(4,2), mar = c(1,0,2.5,0), xaxt = 'n', yaxt = 'n', bty = 'n', cex.main = 2)
plot(x = x, y = y, type = type[1], main = paste0('type = ',type[1]))
plot(x = x, y = y, type = type[2], main = paste0('type = ',type[2]))
plot(x = x, y = y, type = type[3], main = paste0('type = ',type[3]))
plot(x = x, y = y, type = type[4], main = paste0('type = ',type[4]))
plot(x = x, y = y, type = type[5], main = paste0('type = ',type[5]))
plot(x = x, y = y, type = type[6], main = paste0('type = ',type[6]))
plot(x = x, y = y, type = type[7], main = paste0('type = ',type[7]))
plot(x = x, y = y, type = type[8], main = paste0('type = ',type[8]))
par(mfrow = c(1,1))

## ----pch, echo=FALSE, fig.align='center', fig.height=12, fig.width=7, warning=FALSE, fig.cap='Available plotting characters for base R graphics'----
par(mar = c(5.5, 4,4,2) + 0.1)
plot(x = rep(1:10,26), 
     y = rep(seq(251,1,-10), each = 10), 
     pch = 1:260,
     axes = FALSE,
     xlab = '',
     ylab = '',
     cex = 2,
     col = 1:260,
     lwd = 1.5)
mtext(side = 3, text = 1:10, at = 1:10, line = 0, cex = 2)
mtext(side = 2, text = seq(11,251,10), at = seq(241,1,-10), line = 1.2, las = 1, cex = 2)

## ------------------------------------------------------------------------
x <- seq(0, 2 * pi, length.out = 50)
y <- sin(x)

plot(x = x, 
     y = y,
     pch = '?',
     col = 'red')

## ------------------------------------------------------------------------
x <- seq(0, 2 * pi, length.out = 50)
y <- sin(x)

plot(x = x,
     y = y,
     pch = 16,
     cex = c(seq(0.5,12.5,0.5),seq(12.5,0.5,-0.5)),
     col = rainbow(50),
     las = 1,
     cex.axis = 1.25)

## ---- fig.width=7, fig.height=5------------------------------------------
x <- seq(0, 2 * pi, length.out = 50)
y <- sin(x)

eqn = expression(sin(x)%~~%sum(frac(f^~(k)*(0),'k!')~(x-0)^k, k==0, infinity))

plot(x = x, y = y, type = 'h', col = rainbow(50), lwd = 4)
lines(x = x, y = y, lty = 1, lwd = 3, col = 1)
points(x = x, y = y, pch = 16, col = rainbow(50), cex = 2)
abline(h = -0.5, v = 1.5)
text(x = 3, 
     y = .75,
     labels = eqn,
     cex = 1.5,
     family = 'serif',
     font = 2,
     adj = 0)
text(x = 3, 
     y = .35,
     labels = 'This is an equation',
     cex = 1.5,
     family = 'sans',
     font = 3,
     adj = 0)
legend('bottomleft',
       legend = 'sin(x)', 
       bty = 'n',
       fill = 'black')

## ------------------------------------------------------------------------
plot(x = x,
     y = y,
     pch = 16,
     cex = c(seq(0.5,12.5,0.5),seq(12.5,0.5,-0.5)),
     col = rainbow(50),
     xaxt = 'n',
     las = 1,
     cex.axis = 1.25)
box(lwd = 1.5)
axis(side = 1, 
     labels = c('0', 'pi/2', 'pi', '3*pi/2', '2*pi'),
     at = c(0, pi/2, pi, 3*pi/2, 2*pi), 
     cex.axis = 1.25)

## ------------------------------------------------------------------------
plot(x = x,
     y = y,
     pch = 16,
     cex = c(seq(0.5,12.5,0.5),seq(12.5,0.5,-0.5)),
     col = rainbow(50),
     xaxt = 'n',
     las = 1,
     cex.axis = 1.25)
box(lwd = 1.5)
axis(side = 1, 
     labels = parse(text = c('0', 'pi/2', 'pi', '3*pi/2', '2*pi')),
     at = c(0, pi/2, pi, 3*pi/2, 2*pi), 
     cex.axis = 1.25)

## ------------------------------------------------------------------------
plot(x = x,
     y = y,
     pch = 16,
     cex = c(seq(0.5,12.5,0.5),seq(12.5,0.5,-0.5)),
     col = rainbow(50),
     axes =  FALSE,
     las = 1,
     cex.axis = 1.25)
box(lwd = 1.5)
axis(side = 1, 
     labels = parse(text = c('0', 'pi/2', 'pi', '3*pi/2', '2*pi')),
     at = c(0, pi/2, pi, 3*pi/2, 2*pi), 
     cex.axis = 1.25,
     tck = 0.02,
     padj = 0.05)
axis(side = 2, cex.axis = 1.25, tck = 0.02, hadj = 0.75, las = 1)
axis(side = 3, cex.axis = 1.25, tck = 0.02, padj = 0.75)

## ------------------------------------------------------------------------
library(car)
Data <- car::Burt

plot(Data$IQbio, Data$IQfoster, las = 1)
grid(lty = "solid")

abline(h = 100, col = "red")
abline(v = 100, col = "red")

i <- Data$IQbio > 100 &  Data$IQfoster > 100

points(Data$IQbio[i], Data$IQfoster[i], col = "red", pch = 16)
rect(100, 100, 140, 140, col = "#FF000020", border = NA)

## ------------------------------------------------------------------------
library(scales)

x1 <- rnorm(1000)
y1 <- rnorm(1000)

par(oma = c(0,0,1,3))
m <- matrix(c(1,2), ncol = 1)
layout(m, height = c(1,5))

par(mar = c(0,4,0,0))
hist(x1, 
     xaxt = "n",
     yaxt = "n", 
     main = "",
     ylab = "", 
     xlab = "",
     col = alpha('blue',0.6),
     breaks = 100,
     border = 'white')

par(mar = c(4,4,0,0))
plot(x1, y1, 
     xlab = "", 
     ylab = "", 
     las = 1, 
     pch = 16,
     cex = 0.75,
     col = alpha('blue',0.5))

## ------------------------------------------------------------------------
x <- mtcars[order(mtcars$mpg),] # sort by mpg
x$cyl <- factor(x$cyl) # it must be a factor

x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"	

dotchart(x$mpg,
         labels = row.names(x),
         pch = 16,
         cex = 0.7,
         groups = x$cyl,
         main = "Gas Milage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon", 
         gcolor = "black", 
         color = x$color)

## ------------------------------------------------------------------------
set.seed(NULL)

par(mfrow = c(1,2))

x<-sort(sample(1:50,size = 10))
y<-sort(sample(1:50,size = 10))

barplot(x, 
        col = rainbow(10),
        names.arg = LETTERS[1:10],
        space = .25)
legend('topleft',
       legend = x,
       fill = rainbow(10),
       bty = 'n')

barplot(y,
        col = heat.colors(10),
        names.arg = letters[1:10],
        space = 0)
legend('topleft',
       legend = y,
       fill = heat.colors(10),
       bty = 'n')

## ------------------------------------------------------------------------
par(mfrow = c(1,2))

x<-sort(sample(1:50,size = 10))

pie(x, 
    col = topo.colors(10),
    labels = x,
    radius = 1)

pie(x,
    col = terrain.colors(10),
    labels = paste(round(100*x/sum(x), digits = 1),'%', sep = ''),
    radius = 1)

par(mfrow = c(1,1))
mtext(side = 1, 
      'hey hey hey hey hey', 
      line = 2.1)

