
'use-strict';

$.browser = {};

(function() {
    $.browser.msie = false;
    $.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        $.browser.msie = true;
        $.browser.version = RegExp.$1;
    }
})();

function getAllSoftwareWithinOSFS() {
    var allSoftware = [];
    $.ajax({
        url: "/computer/getAllSoftwareWithinOSFS",
        method: "POST",
        "async": false,
        dataType: "json",
        success: function(data) {
            allSoftware = data;
        }
    });
    return allSoftware;
}

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
 * Gets the computer components from IP address, returning in a JSON.
 */
var getComputerComponentsByIpAddress = function (ipAddress) {
    var computer = '';
    $.ajax({
        url: "/computer/getComputerComponentsByIpAddress/",
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
    var modalDiv = document.getElementById(modalId);
    var computer = getComputerByIpAddress(ipAddress);
    var components = getComputerComponentsByIpAddress(ipAddress);
    var numComponents = components.length;
    var softwareClassName = 'app.Software';
    var allSoftware = [];
    var allHardware = [];

    for (var i = 0; i < numComponents; i++) {
        var component = components[i];

        if (!component.class.localeCompare(softwareClassName)) {
            allSoftware.push(component);
        }
        else {
            allHardware.push(component);
        }
    }

    var softwareSize = allSoftware.length;
    var hardwareSize = allHardware.length;

    var modalContent = '<div class="modal-dialog"> \
        <div class="modal-header"> \
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> \
                <span aria-hidden="true">×</span> \
            </button> \
            <h4 class="modal-title">View Computer ' + computer.name + '</h4> \
        </div> \
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
                    <table class="table table-hover" role="table"> \
                        <thead> \
                            <tr> \
                                <th>Hardware</th> \
                            </tr> \
                        </thead> \
                        <tbody>';

    for (var i = 0; i < hardwareSize; i++) {
        var hardware = allHardware[i];

        modalContent +=     '<tr> \
                                <td>' + hardware.name + '</td> \
                            </tr>';
    }

    modalContent += '</tbody> \
                    </table> \
                </div> \
                <div class="col-md-6"> \
                    <table class="table table-hover" role="table"> \
                        <thead> \
                            <tr> \
                                <th>Software</th> \
                            </tr> \
                        </thead> \
                        <tbody>';

    for (var i = 0; i < softwareSize; i++) {
        var software = allSoftware[i];

        modalContent +=     '<tr> \
                                <td>' + software.name + '</td> \
                            </tr>';
    }

    modalContent +=     '</tbody> \
                    </table> \
                </div> \
            </div> \
        </div> \
        <div class="modal-footer"> \
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> \
        </div> \
    </div>';

    modalDiv.innerHTML = modalContent;

    modal.modal('show');
};

var modifyComputer = function(ipAddress) {
    var modalId  = 'modifyComputerModal';
    var modal    = $('#' + modalId);
    var modalContent = '';
    var modalDiv = document.getElementById(modalId);
    var computer = getComputerByIpAddress(ipAddress);
    var components = getComputerComponentsByIpAddress(ipAddress);
    var componentsSize = components.length;
    var allSoftware = getAllSoftwareWithinOSFS();
    var allSoftwareSize = allSoftware.length;

    modalContent = '<div class="modal-dialog"> \
        <div class="modal-header"> \
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> \
                <span aria-hidden="true">×</span> \
            </button> \
            <h4 class="modal-title">View Computer ' + computer.name + '</h4> \
        </div> \
        <form onsubmit="return false;" action="" method="POST"> \
            <div class="modal-body"> \
                <div class="row"> \
                    <div class="col-md-6"> \
                        <h4>This PC Software</h4> \
                        <div class="content well"> \
                            <div id="inbound" class="sort"> \
                                <ul>';

    for (var i = 0; i < componentsSize; i++) {
        var component = components[i];

        modalContent += '<li class="inbound" value="' + component.id + '"> \
                            <div class="tab-pane fade in active"> \
                                <a class="list-group-item"> \
                                    <b>' + component.name + '</b> \
                                </a> \
                            </div> \
                        </li>';
    }

    modalContent +=             '</ul> \
                            </div> \
                        </div> \
                    </div> \
                    <div class="col-md-6"> \
                        <h4>Available Software</h4> \
                        <div class="content well"> \
                            <div class="sort" id="pending"> \
                                <ul>';

    for (var i = 0; i < allSoftwareSize; i++) {
        var software = allSoftware[i];

        modalContent += '<li class="inbound" value="' + software.id + '"> \
                            <div class="tab-pane fade in active"> \
                                <a class="list-group-item"> \
                                    <b>' + software.name + '</b> \
                                </a> \
                            </div> \
                        </li>';
    }

    modalContent +=             '</ul> \
                            </div> \
                        </div> \
                    </div> \
                </div> \
            </div> \
            <div class="modal-footer"> \
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> \
                <button type="submit" class="btn btn-primary" data-dismiss="modal">Modify</button> \
            </div> \
        </form> \
    </div>';

    modalDiv.innerHTML = modalContent;
    modal.modal('show');

    //$('#computer-installed-software')

    $('div.sort li').disableSelection();

    $('#pending ul').sortable({
        revert: 'invalid',
        connectWith: "#inbound ul, #outbound ul",
        items: "li.inbound"
    });

    $('#outbound ul').sortable({
        revert: 'invalid',
        connectWith: "#inbound ul, #pending ul",
        items: "li.inbound"
    });

    $('#inbound ul').sortable({
        revert: 'invalid',
        connectWith: "#pending ul, #outbound ul",
        items: "li.inbound"
    });
};
