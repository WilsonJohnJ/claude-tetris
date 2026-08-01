# Weather Skill - Documentación

## Overview

Se ha creado una **skill a nivel de proyecto** para obtener información del clima de forma local usando el servicio wttr.in (sin requerir API key).

## Estructura Creada

```
.claude/
├── skills/
│   └── weather.md          # Definición de la skill
└── scripts/
    └── get-weather.sh      # Script bash para obtener clima
```

## Características

✅ **Sin dependencias externas** — No requiere instalación de paquetes  
✅ **Sin API Key** — Usa wttr.in, servicio público gratuito  
✅ **Caché local** — Almacena datos por 15 minutos en `~/.cache/claude-weather/`  
✅ **Múltiples ubicaciones** — Funciona para cualquier ciudad/país  
✅ **Datos completos** — Temperatura, humedad, viento, visibilidad, presión, etc.

## Cómo Usar

### Opción 1: Con la Skill (Claude Code)

```bash
/weather                    # Santa Cruz, Bolivia (por defecto)
/weather La Paz, Bolivia
/weather New York, USA
```

### Opción 2: Script Manual

```bash
./.claude/scripts/get-weather.sh "Santa Cruz, Bolivia"
./.claude/scripts/get-weather.sh "La Paz, Bolivia"
```

### Opción 3: Desde JavaScript/Node

En el proyecto Tetris, podrías llamar esto desde el navegador o Node:

```javascript
// Fetch weather data
const location = "Santa Cruz, Bolivia";
fetch(`https://wttr.in/${location}?format=j1`)
    .then(r => r.json())
    .then(data => console.log(data.current_condition[0]));
```

## Información Devuelta

La skill retorna:
- 🌡️ Temperatura actual (°C)
- ☁️ Condición del clima
- 💨 Velocidad y dirección del viento
- 👁️ Visibilidad
- 💧 Humedad
- 🔽 Presión
- ☀️ Índice UV
- 🌧️ Precipitación

## Almacenamiento Local

Los datos se cachean en:
```
~/.cache/claude-weather/weather.json
```

**Duración del caché**: 15 minutos  
**Ubicación**: Home directory (multiplataforma)

## Personalización

### Cambiar ubicación por defecto

Edita `.claude/skills/weather.md` y busca "Santa Cruz, Bolivia":

```markdown
/weather                          # Cambiar esto a tu ciudad
```

### Cambiar duración del caché

En `./.claude/scripts/get-weather.sh`, modifica:

```bash
CACHE_DURATION=900  # Cambiar a segundos (ej: 1800 = 30 minutos)
```

## Requisitos

- `curl` (para descargar datos)
- `jq` (para parsear JSON)
- Internet (para acceder a wttr.in)

## Limitaciones

⚠️ Requiere conexión a internet  
⚠️ Algunas ciudades muy pequeñas podrían tener datos limitados  
⚠️ Los datos se actualizan cada pocos minutos del proveedor

## Ejemplos de Uso

```bash
# Obtener clima de Santa Cruz
/weather

# Obtener clima de La Paz
/weather La Paz

# Obtener clima de cualquier ciudad
/weather Tokyo, Japan
/weather London, UK
/weather Paris, France
```

## Próximas Mejoras

Opcionales:
- [ ] Integración con alertas (temperatura muy alta/baja)
- [ ] Historial de clima local (base de datos SQLite)
- [ ] Notificaciones automáticas
- [ ] Integración con el juego Tetris (cambiar colores según clima)

---

**Creado**: 2026-07-29  
**Ubicación**: `.claude/skills/weather.md` y `.claude/scripts/get-weather.sh`  
**Nivel**: Proyecto
