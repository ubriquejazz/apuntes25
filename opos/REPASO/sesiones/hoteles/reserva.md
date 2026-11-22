## O_S34_BD_Tarea_S35

Tenemos que diseñar una base de datos para gestionar las reservas de hoteles y vuelos que realizan los clientes de una agencia de viajes:

Sucursal (**Id_S**, )

Cliente (**NIF_C**, )

SC (**Id_S**, **NIF_C**, )

Vuelo (**Id_V**, )

Reserva_Vuelo (**Id_S**, **NIF_C**, **ID_V**, Clase)

Hotel (**Id_H**, )

Reserva_Hotel (**Id_S**, **NIF_C**, **ID_H**, Regimen)

Estancia (**Id_S**, **NIF_C**, **ID_H**, **FI**, FD)
