#!/bin/bash

# Solicitar la ruta del entorno virtual
echo "Por favor, ingresa la ruta completa del entorno virtual:"
read venv_path

# Activar el entorno virtual
source $venv_path/bin/activate

# Verificar que el entorno virtual se activó correctamente
if [ $? -ne 0 ]; then
    echo "Error al activar el entorno virtual. Asegúrate de proporcionar la ruta correcta."
    exit 1
fi

# Paso 1: Ejecutar cookiecutter
cookiecutter RecSysFramework

# Desactivar el entorno virtual
deactivate

# Paso 2: Ejecutar helm
helm create recsyshelm
