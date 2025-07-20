# Automation Spotify API

## Descripción del proyecto

Este repositorio contiene las automatizaciones de pruebas con **Karate Framework** para la API de Spotify. El propósito principal es validar el correcto funcionamiento de los endpoints de la [Spotify Web API](https://developer.spotify.com/documentation/web-api), verificando que respondan adecuadamente y cumplan con las especificaciones esperadas.

### Objetivo de las pruebas

Nuestra tarea consiste en:

- Testear que los endpoints de Spotify respondan correctamente
- Agregar validaciones de respuesta (códigos de estado, estructura de datos, tipos de datos)
- Implementar casos de prueba automatizados que cubran diferentes escenarios
- Generar reportes detallados de la ejecución de pruebas

## Stack de tecnología

Este proyecto utiliza las siguientes tecnologías y frameworks:

- **Java 11**: Lenguaje de programación base
- **Maven 3.11.X**: Herramienta de gestión de dependencias y construcción del proyecto
- **Karate Framework**: Framework de automatización de pruebas para APIs REST
- **Cucumber**: Para la generación de reportes en formato BDD
- **Git**: Control de versiones

### Estructura del proyecto

```
src/
├── test/
│   └── java/
│       └── apitests/
│           └── spotify/
│               ├── users/         # Pruebas de endpoints de usuarios
│               │   ├── endpoints_GET.feature    # Tests GET para información de usuario
│               │   └── endpoints_PUT.feature    # Tests PUT para follow/unfollow playlists
│               └── utils/         # Funciones de utilidad y validaciones
│                   └── validators.js            # Validaciones reutilizables (email, URIs, etc.)
target/
├── cucumber-html-reports/         # Reportes en formato HTML
└── karate-reports/               # Reportes específicos de Karate
```

## Requisitos previos

Antes de comenzar, asegúrate de tener instalados los siguientes requisitos en tu sistema:

1. **Java 11**: Verifica que Java 11 esté instalado ejecutando:
   ```bash
   java -version
   ```

Si no está instalado, descárgalo e instálalo desde [Java Downloads](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).

2. **Maven 3.11.X**: Verifica que Maven esté instalado ejecutando:

   ```bash
   mvn -version
   ```

   Si no está instalado, descárgalo e instálalo desde [Maven Downloads](https://maven.apache.org/download.cgi).

3. **Git**: Asegúrate de tener Git instalado para clonar el repositorio. Verifica ejecutando:
   ```bash
   git --version
   ```

## Pasos para iniciar

### Clonar el repositorio

Clona el repositorio en tu máquina local usando el siguiente comando:

```bash
git clone git@github.com:rodrygo-c-garcia/automation_spotify_api.git
```

### Navegar al directorio del proyecto

Cambia al directorio del proyecto clonado:

```bash
cd automation_spotify_api
```

### Compilar el proyecto

Ejecuta el siguiente comando para limpiar y compilar el proyecto:

```bash
mvn clean install
```

### Ejecutar las pruebas

Para ejecutar las pruebas, utiliza el siguiente comando:

```bash
mvn test
```

## 🔑 Configuración del Token de Spotify

**⚠️ IMPORTANTE**: Antes de ejecutar las pruebas, debes configurar un token válido de Spotify.

### Pasos para actualizar el token:

1. **Abrir Postman** con la colección de _Proyecto Final Modulo 4 - Pruebas de API_
2. **Ir a la pestaña Authorization** de la colección
3. **Hacer clic en "Refresh Token"** para obtener un nuevo token válido
4. **Copiar el nuevo token** generado
5. **Abrir el archivo** `src/test/java/karate-config.js` en tu editor
6. **Reemplazar el valor actual** del token con el nuevo valor:

```javascript
// En karate-config.js
function fn() {
  var config = {
    baseUrl: "https://api.spotify.com/v1",
    token: "TU_NUEVO_TOKEN_AQUI", // ← Reemplazar aquí
  };
  return config;
}
```

7. **Guardar el archivo** y ejecutar las pruebas:

```bash
mvn test
```

### Notas importantes sobre el token:

- 🕐 **Expiración**: Los tokens de Spotify expiran en aproximadamente 1 hora
- 🔄 **Renovación**: Debes refrescar el token antes de cada ejecución de pruebas

### Troubleshooting:

Si obtienes errores **401 Unauthorized**:

1. Verifica que el token esté actualizado
2. Confirma que tiene los scopes necesarios
3. Asegúrate de que no haya espacios extra al copiar/pegar

## Reportes de ejecución

Después de ejecutar las pruebas, se generan automáticamente reportes en dos formatos:

### Reportes de Karate

Los reportes se encuentran en la carpeta `target/karate-reports/` e incluyen:

- `karate-summary.html`: Resumen general de la ejecución
- `karate-timeline.html`: Línea de tiempo de ejecución
- Reportes individuales por cada feature ejecutado

### Reportes de Cucumber

Los reportes se encuentran en la carpeta `target/cucumber-html-reports/` e incluyen:

- `overview-features.html`: Vista general de todas las features
- `overview-failures.html`: Resumen de fallos
- Reportes detallados por tags y features

## Casos de prueba implementados

Este proyecto incluye casos de prueba para los siguientes endpoints de Spotify:

- **Endpoints generales**: Verificación de conectividad y respuestas básicas
- **Playlists**: Operaciones CRUD en playlists (crear, leer, actualizar, eliminar)
- **Usuarios**: Gestión de información de usuarios y perfiles
- ...

## Notas adicionales

- Asegúrate de que las variables de entorno `JAVA_HOME` y `MAVEN_HOME` estén configuradas correctamente.
- Si encuentras algún problema, verifica que las versiones de Java y Maven sean las requeridas.
