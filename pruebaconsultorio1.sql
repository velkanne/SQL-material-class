CREATE TABLE Consultorios (
    ID_Consultorio INT NOT NULL,
    Ubicacion NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_Consultorio PRIMARY KEY (ID_Consultorio)
);

CREATE TABLE Medicos (
    N_Colegiado NVARCHAR(50) NOT NULL,
    Rut_Medico NVARCHAR(20) NOT NULL,
    Nombre_Completo NVARCHAR(255) NOT NULL,
    Especialidad NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Medico PRIMARY KEY (N_Colegiado),
    CONSTRAINT UQ_RutMedico UNIQUE (Rut_Medico)
);

CREATE TABLE Pacientes (
    Rut_Paciente NVARCHAR(20) NOT NULL,
    Nombre_Completo NVARCHAR(255) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    N_Contacto NVARCHAR(50) NULL,
    Email NVARCHAR(255) NULL,
    CONSTRAINT PK_Paciente PRIMARY KEY (Rut_Paciente)
);

CREATE TABLE Consultas_Medicas (
    ID_Consulta INT NOT NULL,
    Rut_Medico NVARCHAR(20) NOT NULL,
    Rut_Paciente NVARCHAR(20) NOT NULL,
    ID_Consultorio INT NOT NULL,
    Fecha_Hora_Consulta DATETIME NOT NULL,
    Diagnostico NVARCHAR(255) NULL,
    Observacion NVARCHAR(MAX) NULL,
    CONSTRAINT PK_Consulta PRIMARY KEY (ID_Consulta),
    CONSTRAINT FK_Consulta_Medico FOREIGN KEY (Rut_Medico)
        REFERENCES Medicos(Rut_Medico)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Consulta_Paciente FOREIGN KEY (Rut_Paciente)
        REFERENCES Pacientes(Rut_Paciente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Consulta_Consultorio FOREIGN KEY (ID_Consultorio)
        REFERENCES Consultorios(ID_Consultorio)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT UQ_ConsultaUnica UNIQUE (Rut_Medico, ID_Consultorio, Fecha_Hora_Consulta)
);