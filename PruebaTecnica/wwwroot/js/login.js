// Bootstrap validation
(function () {
    'use strict';
    window.addEventListener('load', function () {
        var forms = document.getElementsByClassName('needs-validation');
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                var documento = document.getElementById('documento');
                var password = document.getElementById('clave');
                var documentoRegex = /^[0-9]+$/;
                var passwordRegex = /^[0-9]+$/;

                if (!documentoRegex.test(documento.value)) {
                    documento.setCustomValidity('El documento solo puede contener números positivos.');
                } else {
                    documento.setCustomValidity('');
                }

                if (!passwordRegex.test(password.value)) {
                    password.setCustomValidity('La contraseña solo puede contener números positivos.');
                } else {
                    password.setCustomValidity('');
                }

                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();

// Keyboard functionality
document.addEventListener('DOMContentLoaded', function () {
    let lastActiveInput = null;
    const inputDocumento = document.getElementById('documento');
    const inputClave = document.getElementById('clave');
    const buttons = document.querySelectorAll('.btn-number');
    const limpiarButton = document.querySelector('.btn-limpiar');

    inputDocumento.addEventListener('focus', function () {
        lastActiveInput = inputDocumento;
    });

    inputClave.addEventListener('focus', function () {
        lastActiveInput = inputClave;
    });

    inputDocumento.addEventListener('input', function () {
        if (inputDocumento.value < 0) {
            inputDocumento.value = '';
        }
    });

    inputClave.addEventListener('input', function () {
        if (inputClave.value < 0) {
            inputClave.value = '';
        }
    });

    buttons.forEach(button => {
        button.addEventListener('click', function () {
            if (lastActiveInput) {
                const buttonText = button.textContent.trim();
                if (!isNaN(buttonText) && buttonText !== '' && parseInt(buttonText) >= 0) {
                    lastActiveInput.value += buttonText;
                } else if (button.classList.contains('btn-limpiar')) {
                    lastActiveInput.value = '';
                } else {
                    alert('Por favor, ingrese solo números positivos.');
                }
            }
        });
    });

    limpiarButton.addEventListener('click', function () {
        if (lastActiveInput) {
            lastActiveInput.value = '';
        }
    });
});