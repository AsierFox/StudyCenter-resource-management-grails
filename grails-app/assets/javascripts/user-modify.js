
(function() {
    var userActualRol = document.getElementById('userToModifyRol').value;
    var userActualDepartament = document.getElementById('userToModifyDepartament');
    var userActualAvailable = document.getElementById('userToModifyAvailable');

    if (userActualRol == 'User') {
        fillSelectClassRooms('select-class');
    }

    $('#user-rol option:contains("' + userActualRol + '")').prop('selected', true);
    if (userActualDepartament) {
        userActualDepartament = document.getElementById('userToModifyDepartament').value;
        $('#user-departament option:contains("' + userActualDepartament + '")').prop('selected', true);
    }
    if (userActualAvailable) {
        userActualAvailable = document.getElementById('userToModifyAvailable').value;
        $('#user-available option:contains("' + userActualAvailable + '")').prop('selected', true);
    }
})();
