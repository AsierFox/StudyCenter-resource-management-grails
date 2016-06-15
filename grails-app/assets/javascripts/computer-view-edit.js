
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

function refreshPage() {
    document.location = document.location.pathname;
};

function getComputerComponentsByIpAddress(ipAddress) {
    var allComponents = [];
    $.ajax({
        url: "/computer/getComputerComponentsByIpAddress",
        data: { "ipAddress": ipAddress },
        method: "POST",
        "async": false,
        dataType: "json",
        success: function(data) {
            allComponents = data;
        }
    });
    return allComponents;
}

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

function getAllHardware() {
    var allHardware = [];
    $.ajax({
        url: "/hardware/getAllHardware",
        method: "POST",
        "async": false,
        dataType: "json",
        success: function(data) {
            allHardware = data;
        }
    });
    return allHardware;
}

/**
 * Gets the computer from IP address, returning in a JSON.
 */
var getComputerByIpAddress = function(ipAddress) {
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
 * Gets the computer software from IP address, returning in a JSON.
 */
var getComputerSoftwareByIpAddress = function(ipAddress) {
    var computer = '';
    $.ajax({
        url: "/computer/getComputerSoftwareByIpAddress/",
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
 * Gets the computer hardware from IP address, returning in a JSON.
 */
var getComputerHardwareByIpAddress = function(ipAddress) {
    var computer = '';
    $.ajax({
        url: "/computer/getComputerHardwareByIpAddress/",
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

var getComputerUsers = function(ipAddress) {
    var users = [];
    $.ajax({
        url: "/computer/getComputerUsers/",
        data: { ipAddress: ipAddress },
        method: "POST",
        dataType: "json",
        async: false,
        success: function(data) {
            users = data;
        }
    });
    return users;
};

/**
 * Shows the information of the computer with passed IP address
 * inside a modal.
 */
var viewComputer = function(ipAddress, operatingSystem, fileSystem, canModify) {
    var modalId  = 'viewComputerModal';
    var modal    = $('#' + modalId);
    var modalDiv = document.getElementById(modalId);
    var computer = getComputerByIpAddress(ipAddress);
    var components = getComputerComponentsByIpAddress(ipAddress);
    var numComponents = components.length;
    var softwareClassName = 'app.Software';
    var associatedUsers = getComputerUsers(ipAddress);
    var associatedUsersSize = associatedUsers.length;
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
                <div class="col-md-3"> \
                    <h5><b>Computer name:</b></h5> \
                    <p>' + computer.name + '</p> \
                </div> \
                <div class="col-md-3"> \
                    <h5><b>Ip address:</b></h5> \
                    <p>' + computer.ipAddress + '</p> \
                </div> \
                <div class="col-md-3"> \
                    <h5><b>Operating system:</b></h5> \
                    <p>' + operatingSystem + '</p> \
                </div> \
                <div class="col-md-3"> \
                    <h5><b>File system:</b></h5> \
                    <p>' + fileSystem + '</p> \
                </div> \
            </div> \
            <div class="row"> \
                <div class="col-md-4"> \
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
                <div class="col-md-4"> \
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
                <div class="col-md-4"> \
                    <table class="table table-hover" role="table"> \
                        <thead> \
                            <tr> \
                                <th>Users</th> \
                            </tr> \
                        </thead> \
                        <tbody>';

    for (var i = 0; i < associatedUsersSize; i++) {
        var user = associatedUsers[i];

        modalContent +=     '<tr>';

        if (canModify) {
            if (canModify == 'true') {
                modalContent +=         '<td>' + user.username + ' <a href="/user/modify/' + user.id + '"> <i class="fa fa-pencil"></i></a></td>';
            } else {
                modalContent +=         '<td>' + user.username + '</td>';
            }
        } else {
            modalContent +=         '<td>' + user.username + '</td>';
        }
        modalContent +=     '</tr>';
    }

    modalContent += '</tbody> \
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

var updateComputerSoftware = function(computerName) {
    var newSoftware = [];

    $('#inbound li').each(function(val) {
        newSoftware.push($(this).children().children().children().text());
    });

    swal({
        title: 'Update the software of ' + computerName + '?',
        text: 'The software of the computer ' + computerName + ' will be updated.',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.ajax({
            url: "/software/updateComputerSoftware",
            method: "POST",
            data: { "computerName": computerName, "newSoftware": newSoftware },
            dataType: "json",
            success: function(data) {
                if (!data.success) {
                    sweetAlert('Error updating the computer software', data.error, 'error');
                    return;
                }
                swal({
                    title: 'The computer software was updated!',
                    type: 'success',
                    showLoaderOnConfirm: true
                }, function() {
                    refreshPage();
                });
            },
            error: function(err) {
                sweetAlert('Error updating the computer software', null, 'error');
            }
        });
    });

    return false;
};

var modifyComputerSoftware = function(ipAddress) {
    var modalId  = 'modifyComputerSoftwareModal';
    var modal    = $('#' + modalId);
    var modalContent = '';
    var modalDiv = document.getElementById(modalId);
    var computer = getComputerByIpAddress(ipAddress);
    var computerSoftware = getComputerSoftwareByIpAddress(ipAddress);
    var computerSoftwareSize = computerSoftware.length;
    var allSoftware = getAllSoftwareWithinOSFS();
    var allSoftwareSize = allSoftware.length;

    modalContent = '<div class="modal-dialog"> \
        <div class="modal-header"> \
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> \
                <span aria-hidden="true">×</span> \
            </button> \
            <h4 class="modal-title">Modify software of Computer ' + computer.name + '</h4> \
        </div> \
        <form onsubmit="return updateComputerSoftware(\'' + computer.name + '\')" action="" method="POST"> \
            <div class="modal-body"> \
                <div class="row"> \
                    <div class="col-md-6"> \
                        <div class="row"> \
                        </div> \
                        <center> \
                            <i class="fa fa-desktop" style="font-size:35px"></i> \
                            <h4>' + computer.name + ' Software</h4> \
                        </center> \
                        <div class="content well"> \
                            <div id="inbound" class="sort"> \
                                <ul>';

    for (var i = 0; i < computerSoftwareSize; i++) {
        var software = computerSoftware[i];

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
                    <div class="col-md-6"> \
                        <center> \
                            <i class="fa fa-archive" style="font-size:35px"></i> \
                            <h4>Available Software</h4> \
                        </center> \
                        <div class="content well"> \
                            <div class="sort" id="pending"> \
                                <ul>';

    for (var i = 0; i < allSoftwareSize; i++) {
        var software = allSoftware[i];
        var hasAlready = false;
        for (var j = 0; j < computerSoftwareSize; j++) {
            if (software.name == computerSoftware[j].name) {
                hasAlready = true;
                break;
            }
        }
        if (hasAlready) {
            continue;
        }

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
                <button type="submit" class="btn btn-primary">Modify Software</button> \
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


var updateComputerHardware = function(computerName) {
    var newHardware = [];

    $('#inbound li').each(function(val) {
        newHardware.push($(this).children().children().children().text());
    });

    swal({
        title: 'Update the hardware of ' + computerName + '?',
        text: 'The hardware of the computer ' + computerName + ' will be updated.',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.ajax({
            url: "/hardware/updateComputerHardware",
            method: "POST",
            data: { "computerName": computerName, "newHardware": newHardware },
            dataType: "json",
            success: function(data) {
                if (!data.success) {
                    sweetAlert('Error updating the computer hardware', data.error, 'error');
                    return;
                }
                swal({
                    title: 'The computer hardware was updated!',
                    type: 'success',
                    showLoaderOnConfirm: true
                }, function() {
                    refreshPage();
                });
            },
            error: function(err) {
                sweetAlert('Error updating the computer hardware', null, 'error');
            }
        });
    });

    return false;
}

var modifyComputerHardware = function(ipAddress) {
    var modalId  = 'modifyComputerSoftwareModal';
    var modal    = $('#' + modalId);
    var modalContent = '';
    var modalDiv = document.getElementById(modalId);
    var computer = getComputerByIpAddress(ipAddress);
    var computerHardware = getComputerHardwareByIpAddress(ipAddress);
    var computerHardwareSize = computerHardware.length;
    var allHardware = getAllHardware();
    var allHardwareSize = allHardware.length;

    modalContent = '<div class="modal-dialog"> \
        <div class="modal-header"> \
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> \
                <span aria-hidden="true">×</span> \
            </button> \
            <h4 class="modal-title">Modify hardware of computer ' + computer.name + '</h4> \
        </div> \
        <form onsubmit="return updateComputerHardware(\'' + computer.name + '\')" action="" method="POST"> \
            <div class="modal-body"> \
                <div class="row"> \
                    <div class="col-md-6"> \
                        <div class="row"> \
                        </div> \
                        <center> \
                            <i class="fa fa-desktop" style="font-size:35px"></i> \
                            <h4>' + computer.name + ' Hardware</h4> \
                        </center> \
                        <div class="content well"> \
                            <div id="inbound" class="sort"> \
                                <ul>';

    for (var i = 0; i < computerHardwareSize; i++) {
        var hardware = computerHardware[i];

        modalContent += '<li class="inbound" value="' + hardware.id + '"> \
                            <div class="tab-pane fade in active"> \
                                <a class="list-group-item"> \
                                    <b>' + hardware.name + '</b> \
                                </a> \
                            </div> \
                        </li>';
    }

    modalContent +=             '</ul> \
                            </div> \
                        </div> \
                    </div> \
                    <div class="col-md-6"> \
                        <center> \
                            <i class="fa fa-archive" style="font-size:35px"></i> \
                            <h4>Available Hardware</h4> \
                        </center> \
                        <div class="content well"> \
                            <div class="sort" id="pending"> \
                                <ul>';

    for (var i = 0; i < allHardwareSize; i++) {
        var hardware = allHardware[i];
        var hasAlready = false;
        for (var j = 0; j < computerHardwareSize; j++) {
            if (hardware.name == computerHardware[j].name) {
                hasAlready = true;
                break;
            }
        }
        if (hasAlready) {
            continue;
        }

        modalContent += '<li class="inbound" value="' + hardware.id + '"> \
                            <div class="tab-pane fade in active"> \
                                <a class="list-group-item"> \
                                    <b>' + hardware.name + '</b> \
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
                <button type="submit" class="btn btn-primary">Modify Hardware</button> \
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
