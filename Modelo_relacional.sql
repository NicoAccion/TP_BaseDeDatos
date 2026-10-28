CREATE SCHEMA LOS_SELECTOS;
GO

CREATE TABLE LOS_SELECTOS.Provincia (
    Provincia_Id NUMERIC(18) PRIMARY KEY,
    Provincia_Nombre VARCHAR(255) 
);
GO

CREATE TABLE LOS_SELECTOS.Localidad (
    Localidad_Id NUMERIC(18) PRIMARY KEY,
    Localidad_Nombre VARCHAR(255),
    Provincia_Id NUMERIC(18),
    
    FOREIGN KEY (Provincia_Id)
        REFERENCES LOS_SELECTOS.Provincia(Provincia_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Local (
    Local_Id NUMERIC(18) PRIMARY KEY,
    Local_Nombre VARCHAR(255),
    Local_Direccion VARCHAR(255),
    Local_Telefono VARCHAR(255),
    Local_Email VARCHAR(255),
    Localidad_Id NUMERIC(18),
    
    FOREIGN KEY (Localidad_Id)
        REFERENCES LOS_SELECTOS.Localidad(Localidad_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Empleado (
    Empleado_Id NUMERIC(18) PRIMARY KEY,
    Empleado_Nombre VARCHAR(255),
    Empleado_Apellido VARCHAR(255),
    Empleado_Dni VARCHAR(255),
    Empleado_Puesto VARCHAR(255),
    Empleado_Fecha_Ingreso DATETIME2(6),
    Empleado_Fecha_Nacimiento DATETIME2(6),
    Empleado_Telefono VARCHAR(255),
    Empleado_Email VARCHAR(255),
    Empleado_Domicilio VARCHAR(255),
    Local_Id NUMERIC(18),
    Localidad_Id NUMERIC(18),
    
    FOREIGN KEY (Local_Id)
        REFERENCES LOS_SELECTOS.Local(Local_Id),
    FOREIGN KEY (Localidad_Id)
        REFERENCES LOS_SELECTOS.Localidad(Localidad_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Cliente (
    Cliente_Id NUMERIC(18) PRIMARY KEY,
    Cliente_Nombre VARCHAR(255),
    Cliente_Apellido VARCHAR(255),
    Cliente_Dni VARCHAR(255),
    Cliente_Fecha_Nacimiento DATETIME2(6),
    Cliente_Telefono VARCHAR(255),
    Cliente_Email VARCHAR(255),
    Cliente_Direccion VARCHAR(255),
    Localidad_Id NUMERIC(18),

    FOREIGN KEY (Localidad_Id)
        REFERENCES LOS_SELECTOS.Localidad(Localidad_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Proveedor (
    Proveedor_Id NUMERIC(18) PRIMARY KEY,
    Proveedor_Razon_Social VARCHAR(255),
    Proveedor_Cuit VARCHAR(255),
    Proveedor_Telefono VARCHAR(255),
    Proveedor_Email VARCHAR(255),
    Proveedor_Direccion VARCHAR(255),
    Localidad_Id NUMERIC(18),

    FOREIGN KEY (Localidad_Id)
        REFERENCES LOS_SELECTOS.Localidad(Localidad_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Forma_Pago (
    Forma_Pago_Id NUMERIC(18) PRIMARY KEY,
    Forma_Pago VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Estado_Alquiler (
    Estado_Alquiler_Id NUMERIC(18) PRIMARY KEY,
    Estado_Alquiler VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Tipo_Producto (
    Tipo_Producto_Id NUMERIC(18) PRIMARY KEY,
    Tipo_Producto VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Estado_Reparacion (
    Estado_Reparacion_Id NUMERIC(18) PRIMARY KEY,
    Estado_Reparacion VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Compra (
    Compra_Nro INT PRIMARY KEY,
    Compra_Fecha DATETIME2(6),
    Compra_Total NUMERIC(38, 2),
    Proveedor_Id NUMERIC(18),
    Empleado_Id NUMERIC(18),
    Local_Id NUMERIC(18),

    FOREIGN KEY (Proveedor_Id)
        REFERENCES LOS_SELECTOS.Proveedor(Proveedor_Id),
    FOREIGN KEY (Empleado_Id)
        REFERENCES LOS_SELECTOS.Empleado(Empleado_Id),
    FOREIGN KEY (Local_Id)
        REFERENCES LOS_SELECTOS.Local(Local_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Venta (
    Venta_Nro INT PRIMARY KEY,
    Venta_Fecha_Hora DATETIME2(6),
    Venta_Total NUMERIC(38, 2),
    Cliente_Id NUMERIC(18),
    Empleado_Id NUMERIC(18),
    Local_Id NUMERIC(18),
    Forma_Pago_Id NUMERIC(18),
    
    FOREIGN KEY (Cliente_Id)
        REFERENCES LOS_SELECTOS.Cliente(Cliente_Id),
    FOREIGN KEY (Empleado_Id)
        REFERENCES LOS_SELECTOS.Empleado(Empleado_Id),
    FOREIGN KEY (Local_Id)
        REFERENCES LOS_SELECTOS.Local(Local_Id),
    FOREIGN KEY (Forma_Pago_Id)
        REFERENCES LOS_SELECTOS.Forma_Pago(Forma_Pago_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Producto (
    Producto_Cod VARCHAR(255) PRIMARY KEY,
    Producto_Nombre VARCHAR(255),
    Producto_Descripcion VARCHAR(255),
    Producto_Precio_Venta NUMERIC(38, 2),
    Tipo_Producto_Id NUMERIC(18),

    FOREIGN KEY (Tipo_Producto_Id)
        REFERENCES LOS_SELECTOS.Tipo_Producto(Tipo_Producto_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Categoria_Accesorios (
    Categoria_Accesorios_Id NUMERIC(18) PRIMARY KEY,
    Categoria_Accesorios VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Marca (
    Marca_Id NUMERIC(18) PRIMARY KEY,
    Marca_Nombre VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Accesorio (
    Producto_Cod VARCHAR(255) PRIMARY KEY,
    Accesorio_Color VARCHAR(255),
    Accesorio_Talle VARCHAR(255),
    Categoria_Accesorios_Id NUMERIC(18),
    Marca_Id NUMERIC(18),

    FOREIGN KEY (Categoria_Accesorios_Id)
        REFERENCES LOS_SELECTOS.Categoria_Accesorios(Categoria_Accesorios_Id),
    FOREIGN KEY (Marca_Id)
        REFERENCES LOS_SELECTOS.Marca(Marca_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Categoria_Bicicleta (
    Categoria_Bicicleta_Id NUMERIC(18) PRIMARY KEY,
    Categoria_Bicicleta VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Modelo_Bicicleta (
    Modelo_Bicicleta_Id NUMERIC(18) PRIMARY KEY,
    Modelo_Bicicleta VARCHAR(255),
    Modelo_Bicicleta_Rodado VARCHAR(255),
    Modelo_Bicicleta_Cuadro VARCHAR(255),
    Modelo_Bicicleta_Color VARCHAR(255),
    Marca_Id NUMERIC(18),
    Categoria_Bicicleta_Id NUMERIC(18),

    FOREIGN KEY (Marca_Id)
        REFERENCES LOS_SELECTOS.Marca(Marca_Id),
    FOREIGN KEY (Categoria_Bicicleta_Id)
        REFERENCES LOS_SELECTOS.Categoria_Bicicleta(Categoria_Bicicleta_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Bicicleta_Venta (
    Producto_Cod VARCHAR(255) PRIMARY KEY,
    Modelo_Bicicleta_Id NUMERIC(18),
    Bicicleta_Venta_Meses_Garantia INT,

    FOREIGN KEY (Producto_Cod)
        REFERENCES LOS_SELECTOS.Producto(Producto_Cod),
    FOREIGN KEY (Modelo_Bicicleta_Id)
        REFERENCES LOS_SELECTOS.Modelo_Bicicleta(Modelo_Bicicleta_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Estado_Bici_Alquiler (
    Estado_Bici_Alquiler_Id NUMERIC(18) PRIMARY KEY,
    Estado_Bici_Alquiler VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Bicicleta_Alquiler (
    Bicicleta_Alquiler_Nro_Serie VARCHAR(255) PRIMARY KEY,
    Modelo_Bicicleta_Id NUMERIC(18),
    Local_Id NUMERIC(18),
    Estado_Bici_Alquiler_Id NUMERIC(18),
    Bicicleta_Alquiler_Precio_Hora VARCHAR(255),
    Bicicleta_Alquiler_Precio_Dia VARCHAR(255),

    FOREIGN KEY (Modelo_Bicicleta_Id)
        REFERENCES LOS_SELECTOS.Modelo_Bicicleta(Modelo_Bicicleta_Id),
    FOREIGN KEY (Local_Id)
        REFERENCES LOS_SELECTOS.Local(Local_Id),
    FOREIGN KEY (Estado_Bici_Alquiler_Id)
        REFERENCES LOS_SELECTOS.Estado_Bici_Alquiler(Estado_Bici_Alquiler_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Alquiler (
    Alquiler_Nro INT PRIMARY KEY,
    Alquiler_Fecha_Inicio DATETIME2(6),
    Alquiler_Fecha_Fin_Pactada DATETIME2(6),
    Alquiler_Fecha_Devolucion_Real DATETIME2(6),
    Alquiler_Importe_Total NUMERIC(38, 2),
    Cliente_Id NUMERIC(18),
    Empleado_Id NUMERIC(18),
    Local_Id NUMERIC(18),
    Bicicleta_Alquiler_Nro_Serie VARCHAR(255),
    Estado_Alquiler_Id NUMERIC(18),
    Forma_Pago_Id NUMERIC(18)

    FOREIGN KEY (Cliente_Id)
        REFERENCES LOS_SELECTOS.Cliente(Cliente_Id),
    FOREIGN KEY (Empleado_Id)
        REFERENCES LOS_SELECTOS.Empleado(Empleado_Id),
    FOREIGN KEY (Local_Id)
        REFERENCES LOS_SELECTOS.Local(Local_Id),
    FOREIGN KEY (Bicicleta_Alquiler_Nro_Serie)
        REFERENCES LOS_SELECTOS.Bicicleta_Alquiler(Bicicleta_Alquiler_Nro_Serie),
    FOREIGN KEY (Estado_Alquiler_Id)
        REFERENCES LOS_SELECTOS.Estado_Alquiler(Estado_Alquiler_Id),
    FOREIGN KEY (Forma_Pago_Id)
        REFERENCES LOS_SELECTOS.Forma_Pago(Forma_Pago_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Reparacion (
    Reparacion_Nro INT PRIMARY KEY,
    Reparacion_Numero_Serie_Bici VARCHAR(255),
    Reparacion_Fecha_Ingreso DATETIME2(6),
    Reparacion_Fecha_Entrega_Estimada DATETIME2(6),
    Reparacion_Fecha_Entrega_Real DATETIME2(6),
    Reparacion_Diagnostico VARCHAR(255),
    Reparacion_Precio_Mano_Obra NUMERIC(38, 2),
    Reparacion_Precio_Repuestos NUMERIC(38,2),
    Reparacion_Precio_Total NUMERIC(38,2),
    Cliente_Id NUMERIC(18),
    Empleado_Id NUMERIC(18),
    Local_Id NUMERIC(18),
    Modelo_Bicicleta_Id NUMERIC(18),
    Estado_Reparacion_Id NUMERIC(18),

    FOREIGN KEY (Cliente_Id)
        REFERENCES LOS_SELECTOS.Cliente(Cliente_Id),
    FOREIGN KEY (Empleado_Id)
        REFERENCES LOS_SELECTOS.Empleado(Empleado_Id),
    FOREIGN KEY (Local_Id)
        REFERENCES LOS_SELECTOS.Local(Local_Id),
    FOREIGN KEY (Modelo_Bicicleta_Id)
        REFERENCES LOS_SELECTOS.Modelo_Bicicleta(Modelo_Bicicleta_Id),
    FOREIGN KEY (Estado_Reparacion_Id)
        REFERENCES LOS_SELECTOS.Estado_Reparacion(Estado_Reparacion_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Detalle_Compra (
    Detalle_Compra_Id NUMERIC(18) PRIMARY KEY,
    Compra_Nro INT,
    Producto_Cod VARCHAR(255),
    Detalle_Compra_Cantidad INT,
    Detalle_Compra_Precio_Unitario NUMERIC(38,2),
    Detalle_Compra_Subtotal NUMERIC(38,2)

    FOREIGN KEY (Compra_Nro)
        REFERENCES LOS_SELECTOS.Compra(Compra_Nro),
    FOREIGN KEY (Producto_Cod)
        REFERENCES LOS_SELECTOS.Producto(Producto_Cod)
);
GO

CREATE TABLE LOS_SELECTOS.Detalle_Venta (
    Detalle_Venta_Id NUMERIC(18) PRIMARY KEY,
    Venta_Nro INT,
    Producto_Cod VARCHAR(255),
    Detalle_Venta_Cantidad INT,
    Detalle_Venta_Precio_Unitario NUMERIC(38,2),
    Detalle_Venta_Subtotal NUMERIC(38,2),

    FOREIGN KEY (Venta_Nro)
        REFERENCES LOS_SELECTOS.Venta(Venta_Nro),
    FOREIGN KEY (Producto_Cod)
        REFERENCES LOS_SELECTOS.Producto(Producto_Cod)
);
GO

CREATE TABLE LOS_SELECTOS.Categoria_Repuestos (
    Categoria_Repuestos_Id NUMERIC(18) PRIMARY KEY,
    Categoria_Repuestos VARCHAR(255)
);
GO

CREATE TABLE LOS_SELECTOS.Repuesto (
    Repuesto_Cod VARCHAR(255) PRIMARY KEY,
    Repuesto_Desc VARCHAR(255),
    Repuesto_Compatibilidad VARCHAR(255),
    Repuesto_Precio NUMERIC(38, 2),
    Categoria_Repuestos_Id NUMERIC(18),

    FOREIGN KEY (Categoria_Repuestos_Id)
        REFERENCES LOS_SELECTOS.Categoria_Repuestos(Categoria_Repuestos_Id)
);
GO

CREATE TABLE LOS_SELECTOS.Detalle_Reparacion (
    Detalle_Reparacion_Id NUMERIC(18) PRIMARY KEY,
    Reparacion_Nro INT,
    Repuesto_Cod VARCHAR(255),
    Detalle_Reparacion_Cantidad INT,
    Detalle_Reparacion_Precio_Unitorio NUMERIC(38,2),
    Detalle_Reparacion_Subtotal NUMERIC(38,2)

    FOREIGN KEY (Reparacion_Nro)
        REFERENCES LOS_SELECTOS.Reparacion(Reparacion_Nro),
    FOREIGN KEY (Repuesto_Cod)
        REFERENCES LOS_SELECTOS.Repuesto(Repuesto_Cod)
);
GO
