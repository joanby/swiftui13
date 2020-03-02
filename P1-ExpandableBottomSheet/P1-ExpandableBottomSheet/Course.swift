//
//  Course.swift
//  P1-ExpandableBottomSheet
//
//  Created by Juan Gabriel Gomila Salas on 01/03/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation

struct Course: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var image: String
    var type: String
    var priceLevel: Int
    var visited: Bool = false
    
    
    init(name: String, description: String, image: String, type: String, priceLevel: Int) {
        self.name = name
        self.description = description
        self.image = image
        self.type = type
        self.priceLevel = priceLevel
        self.visited = false
    }
    
    init(){
        self.init(name: "", description: "", image: "", type: "", priceLevel: 0)
    }
}

#if DEBUG
var courses: [Course] = [
    Course(name: "Probabilidad y Variables Aleatorias para ML e IA",
           description: """
            Conoce todo el mundo de las probabilidades y las variables aleatorias de la mano de Ricardo Alberich, Juan Gabriel Gomila y Arnau Mir. Asienta las bases para convertirte en el Data Scientist del futuro con todo el contenido de probabilidades, variables aleatorias discretas y contínuas, desde una variable hasta multidimensionales e incluso los conceptos de convergencia y el Teorema Central del Límite. En particular verás los mismos contenidos que explicamos en los grados de carrera a matemáticos, ingenieros, economistas, biólogos, médicos o informáticos como por ejemplo:

            Repaso de uso básico de R y RStudio y de Anaconda Navigator para Python

            Cálculo de Probabilidades con todas las propiedades, teorema de Bayes, probabilidad condicionada e independencia de sucesos

            Variables aleatorias contínuas y discretas, incluyendo la función de probabilidad, de densidad y de distribución

            Distribuciones notables como la binomial, la geométrica, la uniforme, la exponencial o la normal entre otras

            Complementos avanzados de variables aleatorias como momentos, sesgo, curtosis, función generadora de momentos, función característica y aplicaciones de las mismas (fiabilidad, entropía o generación de distribuciones)

            Variables bidimnsionales para adentrarte en el mundo de las varias variables

            Variables multidimensionales para llevar tu capacidad de análisis probabilístico necesario para el machine learning y la inteligencia artificial a otro nivel analizando cientos o miles de variables a la vez

            Convergencia de variables aleatorias y Teorema Central del límite que son la base de la estadística moderna, el ML y la IA

            Contarás además con el Repositorio Github con todo el material del curso para disponer de los mismos scripts que usamos en clase desde el minuto inicial.

            Cientos de ejercicios, tareas y talleres para complementar la formación en el curso

            Una vez termines el curso podrás seguir con los mejores cursos de análisis de datos publicados por Juan Gabriel Gomila como los cursos avanzados de estadística, de Machine Learning o Inteligencia Artificial con Python o RStudio o el Curso de Data Science con Tidyverse y RStudio. Todo el material del curso está enfocado en resolver los problemas de falta de base en el ámbito de estadística inferencial que presentan los estudiantes de esos cursos avanzados y poderlo hacer en un curso a parte te permitirá nivelar tus conocimientos y tomar los otros cursos con garantías de éxito.

            Lo que aprenderás

            Resolver problemas del ámbito de la probabilidad usando el entorno estadístico R y el lenguaje Python en combinación
            Cálculo de probabilidades básicas y conceptos relacionados como la independencia
            Estudiar las variable aleatorias continuas y discretas
            Conocer y entender las distribuciones de probabilidad más famosas como la familia de las binomiales, Poisson, exponencial, normal o uniforme entre muchas otras
            Realizar un análisis exhaustivo de los momentos, las funciones características y generadoras de momentos, así como el sesgo o la curtosis
            Realizar el análisis de variables bidimensionales y entender las correlaciones e independencia entre variables dos a dos
            Extender los conceptos de correlación e independencia a muchas variables o vectores aleatorios
            Estudiar la convergencia en probabilidad, en distribución o casi segura de variables aleatorias para culminar con el Teorema Central de Límite
            ¿Hay requisitos para realizar el curso?

            Ganas de aprender acerca del mundo de la probabilidad, el azar y las variables aleatorias
            Conocimientos básicos de matemáticas
            Es muy recomendable haber hecho el curso online de estadística descriptiva y el de álgebra lineal con R y Python de Juan Gabriel Gomila
            No es necesaria una base de programación, pero si recomendable para sacar más provecho a la parte de probabilidad y variables aleatorias
            Para la segunda mitad del curso, se necesitan conocimientos medios de matemáticas como derivadas o integrales en varias variables, aunque se pueden hacer por código si se desea.
            ¿Para quién es este curso?

            Estudiantes de ingenierías, economías y ciencias que quieran aprender los fundamentos de la probabilidad y las variables aleatorias
            Todos aquellos que quieran trabajar con el entorno estadístico R y con Python
            Futuros estudiantes de cursos de Machine Learning y de Inteligencia Artificial
            Data Scientists que quieran tener un fundamento sólido de matemáticas, probabilidad y variables aleatorias
            Ingenieros de ML, IA con falta de base para aprender mejor cómo funcionan estos algoritmos y saber interpretar sus valores
            Estudiantes de los cursos de ML, IA, TensorFlow de Juan Gabriel Gomila que necesiten asentar sus bases teóricas en de probabilidad, distribuciones...
            """,
           image: "maths",
           type: "Matemáticas",
           priceLevel: 4),
    Course(name: "Machine Learning de la A a la Z",
           description: "",
           image: "ml_az",
           type: "Machine Learning",
           priceLevel: 5),
    Course(name: "Resuelve problemas de Matemáticas con Sage y Python",
           description: "",
           image: "python",
           type:"Matemáticas",
           priceLevel: 2),
    Course(name: "Aprueba la Selectividad con problemas resueltos",
           description: "",
           image: "selectividad",
           type: "Matemáticas",
           priceLevel: 2),
    Course(name: "Curso de introducción a Swift UI desde cero",
           description: "",
           image: "swift",
           type: "Desarrollo de Apps",
           priceLevel: 1),
    Course(name: "TensorFlow 2: Curso de Actualización Completo",
           description: "",
           image: "tensorflow2",
           type: "Machine Learning",
           priceLevel: 4),
    Course(name: "Curso Completo de Unreal Engine de cero a experto",
           description: "",
           image: "unrealengine",
           type: "Videojuegos",
           priceLevel: 4),
    Course(name: "Curso de Unity 2019: Aprende a crear juegos de rol",
           description: "",
           image: "videogames",
           type: "Videojuegos",
           priceLevel: 3)
]
#endif
