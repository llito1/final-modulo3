CREATE DATABASE biblioteca2;
USE biblioteca2;

CREATE TABLE Editorial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    contacto VARCHAR(255)
);

CREATE TABLE Book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    tema VARCHAR(255)
);

CREATE TABLE Ejemplar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    ubicacion VARCHAR(255),
    estado ENUM('disponible', 'en reparación', 'perdido') NOT NULL,
    categoria ENUM('A', 'B', 'C', 'D', 'E', 'F') NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(id) ON DELETE CASCADE
);

CREATE TABLE Socio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    categoria ENUM('B', 'C', 'D', 'E', 'F') NOT NULL
);

CREATE TABLE Prestamo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    socio_id INT,
    ejemplar_id INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    nota TEXT,
    estado ENUM('activo', 'perdido', 'devuelto') NOT NULL,
    FOREIGN KEY (socio_id) REFERENCES Socio(id) ON DELETE CASCADE,
    FOREIGN KEY (ejemplar_id) REFERENCES Ejemplar(id) ON DELETE CASCADE
);

CREATE TABLE HistorialPrestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prestamo_id INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    nota TEXT,
    estado ENUM('devuelto', 'perdido') NOT NULL,
    FOREIGN KEY (prestamo_id) REFERENCES Prestamo(id) ON DELETE CASCADE
);

CREATE TABLE Book_Editorial (
    book_id INT,
    editorial_id INT,
    PRIMARY KEY (book_id, editorial_id),
    FOREIGN KEY (book_id) REFERENCES Book(id) ON DELETE CASCADE,
    FOREIGN KEY (editorial_id) REFERENCES Editorial(id) ON DELETE CASCADE
);

