const municipiosPorDepartamento = {
    "Antioquia": ["Medellín", "Envigado", "Bello", "Itagüí"],
    "Cundinamarca": ["Bogotá", "Soacha", "Chía", "Zipaquirá"],
    "Valle del Cauca": ["Cali", "Palmira", "Buenaventura", "Tuluá"],
    "Santander": ["Bucaramanga", "Floridablanca", "Girón", "Piedecuesta"],
    "Bolívar": ["Cartagena", "Magangué", "Turbaco", "Arjona"]
};

document.getElementById('departamento').addEventListener('change', function() {
    const departamento = this.value;
    const municipios = municipiosPorDepartamento[departamento] || [];
    const municipioSelect = document.getElementById('municipio');

    municipioSelect.innerHTML = '<option value="" disabled selected hidden>Seleccione un municipio</option>';
    municipios.forEach(function(municipio) {
        const option = document.createElement('option');
        option.value = municipio;
        option.textContent = municipio;
        municipioSelect.appendChild(option);
    });
});

document.getElementById('clave').addEventListener('input', function() {
    const claveInput = this.value;
    const claveMessage = document.getElementById('claveMessage');
    if (claveInput.length > 4) {
        claveMessage.textContent = 'Solo se permiten 4 números';
        claveMessage.style.color = 'gray';
    } else {
        claveMessage.textContent = '';
    }
    validateForm();
});

document.getElementById('confirmarClave').addEventListener('input', function() {
    const claveInput = document.getElementById('clave').value;
    const confirmarClaveInput = this.value;
    const confirmarClaveMessage = document.getElementById('confirmarClaveMessage');
    if (confirmarClaveInput !== claveInput) {
        confirmarClaveMessage.textContent = 'Las claves no coinciden';
        confirmarClaveMessage.style.color = 'gray';
    } else {
        confirmarClaveMessage.textContent = '';
    }
    validateForm();
});

function validateForm() {
    const requiredFields = document.querySelectorAll('input[required], select[required]');
    let allFilled = true;
    requiredFields.forEach(function(field) {
        if (!field.value) {
            allFilled = false;
        }
    });
    const submitButton = document.getElementById('submitButton');
    submitButton.disabled = !allFilled;
}

document.querySelectorAll('input[required], select[required]').forEach(function(field) {
    field.addEventListener('input', validateForm);
});