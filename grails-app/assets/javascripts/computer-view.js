
/**
 * Gets the computer from IP address, returning in a JSON.
 */
var getComputerByIpAddress = function (ipAddress) {
    var computer = '';
    $.ajax({
        url: "/computer/getComputerByIpAddress/",
        data: { ipAddress: ipAddress },
        method: "POST",
        dataType: "json",
        async: false,
        success: function(data) {
            computer = data;
        }
    });
    return computer;
};

/**
 * Shows the information of the computer with passed IP address
 * inside a modal.
 */
var viewComputer = function(ipAddress) {
    var modalId  = 'viewComputerModal';
    var modal    = $('#' + modalId);
    var computer = getComputerByIpAddress(ipAddress);
    console.log(computer.components);

    document.getElementById(modalId).innerHTML = '<div class="modal-dialog"> \
        <div class="modal-header"> \
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> \
                <span aria-hidden="true">×</span> \
            </button> \
            <h4 class="modal-title">View Computer ' + computer.name + '</h4> \
        </div> \
        <form onsubmit="return processNotifyIsueForm()" action="" method="POST"> \
            <div class="modal-body"> \
                <div class="row"> \
                    <div class="col-md-4"> \
                        <h4>Computer name:</h4> \
                        <p>' + computer.name + '</p> \
                    </div> \
                    <div class="col-md-4"> \
                        <h4>Classroom:</h4> \
                        <p>' + computer.ipAddress + '</p> \
                    </div> \
                    <div class="col-md-4"> \
                        <h4>Ip address:</h4> \
                        <p>' + computer.ipAddress + '</p> \
                    </div> \
                </div> \
                <div class="row"> \
                    <div class="col-md-6"> \
                        <h4>Hardware:</h4> \
                        <table class="table table-hover" role="table"> \
                            <thead> \
                            </thead> \
                            <tbody> \
                            </tbody> \
                        </table> \
                    </div> \
                    <div class="col-md-6"> \
                        <h4>Software:</h4> \
                        <table class="table table-hover" role="table"> \
                            <thead> \
                            </thead> \
                            <tbody> \
                            </tbody> \
                        </table> \
                    </div> \
                </div> \
            </div> \
            <div class="modal-footer"> \
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> \
            </div> \
        </form> \
    </div>';
    modal.modal('show');

    return false;
};
