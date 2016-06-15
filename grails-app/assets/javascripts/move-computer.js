
function refreshPage() {
    document.location = document.location.pathname;
};

var moveComputerToAnotherClassroom = function(ipAddress, classroomFloor, classroomNumber) {
    var classroomSelect = document.getElementById('allClassroomsSelect');
    var selectedOption = classroomSelect.options[classroomSelect.selectedIndex];

    if (classroomNumber == selectedOption.value) {
        sweetAlert('Same classroom selected', 'This computer is already on ' + selectedOption.text, 'error');
        return false;
    }

    swal({
        title: 'Move the computer?',
        text: 'The computer will be moved to ' + selectedOption.text + '.',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.ajax({
            url: "/computer/moveComputer",
            method: "POST",
            data: { "ipAddress": ipAddress, "oldClassroomNumber": classroomNumber, "classroomNumber": selectedOption.value },
            dataType: "json",
            success: function(data) {
                if (!data.success) {
                    sweetAlert('Error moving the computer', data.error, 'error');
                    return false;
                }
                swal({
                    title: 'The computer was moved successfully!',
                    type: 'success',
                    showLoaderOnConfirm: true
                }, function() {
                    refreshPage();
                });
            }
        });
    });

    return false;
}

/**
 * Moves the computer to another classroom.
 */
function moveComputer(ipAddress, classroomFloor, classroomNumber) {
    var modalId  = 'moveComputerModal';
    var modal    = $('#' + modalId);
    var modalDiv = document.getElementById(modalId);

    var modalContent = '<div class="modal-dialog"> \
        <div class="modal-header"> \
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> \
                <span aria-hidden="true">×</span> \
            </button> \
            <h4 class="modal-title">Move Computer</h4> \
        </div> \
            <form onsubmit="return moveComputerToAnotherClassroom(\'' + ipAddress + '\', ' + classroomFloor + ', ' + classroomNumber + ')"> \
                <div class="modal-body"> \
                    <div class="row"> \
                        <div class="col-md-6"> \
                            <h4>Choose the classroom floor:</h4> \
                            <select id="allClassroomsSelect" class="form-control"></select> \
                        </div> \
                    </div> \
                </div> \
                <div class="modal-footer"> \
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> \
                    <button type="submit" class="btn btn-primary">Modify</button> \
                </div> \
            </form> \
        </div>';

    modalDiv.innerHTML = modalContent;

    fillSelectClassRooms('allClassroomsSelect');

    modal.modal('show');
}
