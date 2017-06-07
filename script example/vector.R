x <-5 * 6
x

is.vector(x)
length(x)

x[2]<-31
x

x[5]<-44
x

x[11]

x[0]

x <- 1:4
x

y<-x^2
y

x<-1:5
y<-3:7
x
y

x+y

z<-y[-5]

x+z

x

y<-x[-5]

y[5]<-NA
y

x+y


str(c("Hello","worshop","participants!"))

str(c(9:11, 200, x))

str(c("something",pi, 2:4, pi>3))

w <- rnorm(10)
seq_along((w))
w
which(w < 0)
w[which(w<0)]
w[-c(2,5)]

list("something", pi, 2:4, pi>3)

str(list("something", pi, 2:4, pi>3))

x<- list(vegetable="cabbage",
         number=pi,
         series=2:4,
         telling=pi>3)
str(x)

x$vegetable

x[1]

str(x[1])

x[3]
str(x[[3]])

x<- list(vegetable = list("cabbage", "carrot","spinach"),
         number = list (c(pi,0,2.14,NA)),
         series = list(list(2:4,3:5)),
         telling = pi>3)
str(x)
str(x$vegetable)
