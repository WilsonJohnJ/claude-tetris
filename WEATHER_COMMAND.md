# 🌦️ Comando Weather (Skill)

Tu skill de clima está lista para usar como comando.

## Opción 1: Usar en Claude Code (Recomendado)

Si configuraste Claude Code correctamente, puedes usar:

```bash
/weather
/weather La Paz
/weather New York, USA
```

## Opción 2: Script Directo (Funciona siempre)

Ejecuta el script bash directamente:

```bash
# Clima de Santa Cruz (default)
./.claude/scripts/get-weather.sh

# Clima de cualquier ciudad
./.claude/scripts/get-weather.sh "La Paz, Bolivia"
./.claude/scripts/get-weather.sh "New York, USA"
./.claude/scripts/get-weather.sh "Tokyo, Japan"
```

## Opción 3: Crear Alias (Opcional)

Agrega esto a tu `.zshrc` o `.bashrc`:

```bash
alias weather="./.claude/scripts/get-weather.sh"
```

Luego puedes usar:
```bash
weather
weather La Paz
```

## Lo que Recibirás

Un reporte ASCII art con:
- 🌡️ Temperatura actual
- ☁️ Condición del clima (Sunny, Cloudy, Rainy, etc.)
- 💨 Velocidad y dirección del viento
- 👁️ Visibilidad
- 💧 Precipitación
- 📅 Pronóstico de 3 días
- ⏰ Detalles por período (Morning, Noon, Evening, Night)

## Ubicación del Script

- **Script**: `./.claude/skills/weather.md`
- **Ejecutable**: `./.claude/scripts/get-weather.sh`
- **Configuración**: `./.claude/settings.json`

## Ejemplos de Uso

```bash
# Default (Santa Cruz, Bolivia)
./.claude/scripts/get-weather.sh

# Otras ciudades
./.claude/scripts/get-weather.sh "Madrid, Spain"
./.claude/scripts/get-weather.sh "Sydney, Australia"
./.claude/scripts/get-weather.sh "Berlin, Germany"
```

## Ventajas

✅ Sin API key requerida  
✅ Información completa y actualizada  
✅ Pronóstico a 3 días  
✅ Formato visual agradable  
✅ Funciona offline una vez se cachea

## Notas

- Requiere internet para obtener datos frescos
- wttr.in actualiza cada pocos minutos
- No hay límite de llamadas para uso personal
- Compatible con cualquier ciudad/país

---

**¿Ya lo probaste?** Usa uno de los comandos arriba para ver el clima en tiempo real 🌍
