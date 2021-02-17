import 'package:flutter/material.dart';
import 'dart:ui';

class Producto{
  //Atributos de la base de datos
  final int id;
  final String titulo;
  final double precio;
  final String estado;
  final String categoria;

  //Atributos relacionados con el producto
  final String imagen, descripcion;
  final String marca;
  final Color color;

  Producto({
    this.id,
    this.titulo,
    this.precio,
    this.estado,
    this.categoria,
    this.imagen,
    this.descripcion,
    this.marca,
    this.color
    }
  );
}

List<Producto> productos = [
  Producto(
    id: 1,
    titulo: "Yamaha PSS-A50",
    precio: 950,
    estado: "Nuevo",
    categoria: "Instrumentos musicales",
    imagen: "assets/images/bag_1.png",
    descripcion: "Desde la interpretación hasta la grabación, este teclado móvil puede hacerlo todo. Mini teclado de alta calidad y sensible al tacto 42 voces (instrumentos) 138 tipos de arpegios Grabador de frases Efecto motion Conexión USB-MIDI Ligero y compacto Altavoz incorporado / toma de auriculares Alimentado por batería y bus USB (el adaptador de alimentación USB se vende por separado)",
    marca: "Yamaha",
    color: Color(0xFF3D82AE)
  ),
  Producto(
    id: 2,
    titulo: "teclado Casio SA 76",
    precio: 550,
    estado: "Nuevo",
    categoria: "Instrumentos musicales",
    imagen: "assets/images/bag_2.png",
    descripcion: "Nuevo teclado CASIO SA 76",
    marca: "Casio",
    color: Color(0xFFD3A984)
  ),
  Producto(
    id: 3,
    titulo: "Repetidor Wifi Xiaomi",
    precio: 110,
    estado: "Nuevo",
    categoria: "Electrónica",
    imagen: "assets/images/bag_3.png",
    descripcion: "Amplia tu señal Wifi con este repetidor xiaomi",
    marca: "Xiaomi",
    color: Color(0xFF989493)
  ),
];

// final instrumentosMusicales = [
//   new Producto(
//     id: 1,
//     nombre: "teclado Yamaha AA-50",
//     precio: 950,
//     estado: "Nuevo",
//     categoria: "Instrumentos musicales"
//     ),
//   new Producto(
//     id: 2,
//     nombre: "teclado Casio SA 76",
//     precio: 550,
//     estado: "Medio uso",
//     categoria: "Instrumentos musicales"
//     ),  
// ];