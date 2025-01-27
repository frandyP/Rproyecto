library(httr)
library(jsonlite)
library(plotly)

datosBanco <- read.csv("http://www.bagricola.gob.do/transparencia/images/datosabiertos/v2/2021/Enero/Cartera de Pr�stamos, BAGRICOLA, 2017-2021.csv", header = T)

View(datosBanco)

Sucursal <- c(datosBanco$SUCURSAL)
Cantidad <-c(datosBanco$CANTIDAD.DE.PRESTAMOS)
Valor <- c(datosBanco$VALOR)
Mes <- c(datosBanco$MES)
A�o <- c(datosBanco$A.O)


#1-Tabla de Cantidad de prestamos por a�o
Dframe_A�o_Cantidad <- data.frame(A�o, Cantidad)

View(Dframe_A�o_Cantidad)

#2-Tabla de Cantidad de prestamos por sucursal
Dframe_Sucursal_Cantidad <- data.frame(Sucursal, Cantidad)

View(Dframe_Sucursal_Cantidad)

#3-Tabla de Cantidad de prestamos por mes
Dframe_Mes_Cantidad <- data.frame(Mes, Cantidad)

View(Dframe_Mes_Cantidad)



#1-Grafica de Cantidad de prestamos por mes
p=plot_ly(Dframe_A�o_Cantidad, x= ~A�o, y= ~Cantidad,
          name= 'Cantidad',
          type= 'bar')

p%>% layout(title="Cantidad de Prestamos Otorgados por A�o")

#2-Grafica de Cantidad de prestamos por sucursal
p=plot_ly(Dframe_Sucursal_Cantidad, x= ~Sucursal, y= ~Cantidad,
          name= 'Cantidad',
          type= 'bar')

p%>% layout(title="Cantidad de Prestamos Otorgados por Sucursal")

#3-Grafica de Cantidad de prestamos por mes
p=plot_ly(Dframe_Mes_Cantidad, x= ~Mes, y= ~Cantidad,
          name= 'Cantidad',
          type= 'bar')

p%>% layout(title="Cantidad de Prestamos Otorgados por Mes")

#4-Grafica de Cantidad de prestamos por A�o
fig <- plot_ly(Dframe_A�o_Cantidad, labels = ~A�o, values = ~Cantidad, type = 'pie')
fig%>% layout(title="Cantidad de Prestamos Otorgados por A�o")

#5-Grafica de Cantidad de prestamos por Sucursal
fig2 <- plot_ly(Dframe_Sucursal_Cantidad, labels = ~Sucursal, values = ~Cantidad, type = 'pie')
fig2%>% layout(title="Cantidad de Prestamos Otorgados por A�o")






