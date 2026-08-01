---
name: clima
description: Obtén información del clima en tiempo real para cualquier ciudad usando wttr.in (sin API key)
tags: [weather, utilities, Bolivia]
---

# Clima - Información Meteorológica

Obtén el clima actual y pronóstico para cualquier ubicación usando wttr.in (servicio gratuito sin API key).

## Cómo usar

Ejecuta el skill proporcionando una ciudad o ubicación:

```
/clima "La Paz, Bolivia"
/clima "Madrid, España"
/clima "Nueva York, USA"
/clima                    # Por defecto: Santa Cruz, Bolivia
```

## Información que retorna

- 🌡️ **Temperatura actual** con sensación térmica
- ☁️ **Condición del clima** (Soleado, Nublado, Lluvioso, etc.)
- 💨 **Viento** - Velocidad y dirección
- 👁️ **Visibilidad**
- 💧 **Humedad y precipitación**
- 🔽 **Presión**
- ☀️ **Índice UV**
- 📅 **Pronóstico a 3 días** por períodos (Mañana, Mediodía, Tarde, Noche)

## Características

✅ Sin API key requerida  
✅ Datos en tiempo real  
✅ Funciona para cualquier ciudad del mundo  
✅ Formato visual ASCII art  
✅ Pronóstico a 3 días incluido  
✅ Requiere conexión a internet

## Ejemplos de uso

### Santa Cruz, Bolivia (por defecto)
```bash
/clima
```

### La Paz, Bolivia
```bash
/clima "La Paz, Bolivia"
```

### Ciudades internacionales
```bash
/clima "Madrid, España"
/clima "Nueva York, USA"
/clima "Tokio, Japón"
/clima "París, Francia"
```

## Script asociado

- Ubicación: `./.claude/scripts/get-weather.sh`
- Servicio: wttr.in
- Cache: Disponible localmente en `~/.cache/claude-weather/`

## Notas

- La ubicación debe estar entre comillas si tiene espacios
- Si no especificas ubicación, usa Santa Cruz, Bolivia por defecto
- Los datos se actualizan cada pocos minutos
- Compatible con cualquier ciudad o código postal del mundo

---

**Creado**: 2026-07-29  
**Nivel**: Proyecto  
**Ubicación**: `./.claude/skills/clima.md`
