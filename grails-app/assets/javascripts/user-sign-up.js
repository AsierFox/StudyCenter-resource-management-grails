
'use-strict';

/**
 * Ajax load for the classes at page loaded.
 */
(function() {
    var req = $.ajax({
        url: "/classroom/getAllClassrooms",
        method: "POST",
        dataType: "json"
    });

    req.done(function(data) {
        var classrooms = data;
        var classroomsSize = data.length;
        var classroomList = '';
        var classroomSelect = $('#select-class');

        for (var i = 0; i < classroomsSize; i++) {
            var classroom = classrooms[i];

            classroomSelect
                 .append($("<option></option>")
                    .attr("value", classroom.number)
                    .text('Classroom number ' + classroom.number + ' at Floor ' + classroom.floor));
        }
    });
})();

/**
 * Ajax load for the computers of the classrooms.
 */
var showClassroomComputers = function(sel) {
    var classroomNumber = sel.value;

    var req = $.ajax({
        url: "/classroom/getClassroomComputers/" + classroomNumber,
        method: "POST",
        dataType: "json"
    });

    req.done(function(data) {
        var classroomComputerSelect = $('#select-classroomComputer');
        var computerSize = data.length;

        // Remove options of select
        classroomComputerSelect
            .find('option')
            .remove()
            .end()
            .append('<option value="whatever">Choose a computer</option>')
            .val('whatever');

        // Check if the classroom have computers
        if ( !computerSize ) {
            classroomComputerSelect
                .append($("<option value=''></option>")
                    .text('There are no computers at this classroom.'));
            return;
        }
        var computerList = '';
        var computers = data;

        for (var i = 0; i < computerSize; i++) {
            var computer = computers[i];

            classroomComputerSelect
                .append($("<option></option>")
                        .attr("value", computer.ipAddress)
                        .text('Computer ' + computer.name));
        }
    });
};

/**
 * Validates the form for the user sign up.
 */
var validateForm = function() {
    var errorColor = '#D50000';

    var inputs = document.getElementsByTagName('input');
    var inputsSize = inputs.length;

    var dni            = document.getElementById('form-dni');
    var firstName      = document.getElementById('form-first-name');
    var lastName       = document.getElementById('form-last-name');
    var username       = document.getElementById('form-username');
    var email          = document.getElementById('form-email');
    var password       = document.getElementById('form-password');
    var repeatPassword = document.getElementById('form-repeat-password');
    var computer       = document.getElementById('form-computer');

    for (var i = 0; i < inputsSize; i++) {
        inputs[i].style.borderColor = '#EF5350';
    }

    if ( !formDataHelper.validString(email.value) ||
            !formDataHelper.validateEmail(email.value) )
    {
        email.style.borderColor = errorColor;
        return false;
    }
    if ( !formDataHelper.validatePassword(password.value, repeatPassword.value) ) {
        return false;
    }
    if ( !formDataHelper.validString(computer.value) ) {
        return false;
    }

    return true;
};
