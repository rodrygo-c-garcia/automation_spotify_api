function fn() {
    const calles = [
        'Calle Bolivar',
        'Avenida Sucre',
        'Calle Junin',
        'Avenida las Americas',
        'Calle Orgullo',
        'Calle Esperanza',
        'Avenida 6 de Agosto',
        'Calle Estudiantes',
        'Avenida del Maestro',
        'Calle Potosi',
        'Avenida San Martin',
        'Calle Ayacucho',
        'Avenida Heroinas',
        'Calle Pagador',
        'Avenida Pando',
        'Calle Murillo',
        'Avenida Santa Cruz',
        'Calle Cochabamba',
        'Avenida Villarroel',
        'Calle Universitaria'
    ];

    const indiceAleatorio = Math.floor(Math.random() * calles.length);
    return calles[indiceAleatorio];
}